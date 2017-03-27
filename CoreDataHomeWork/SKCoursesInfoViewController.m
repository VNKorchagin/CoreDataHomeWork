//
//  SKCoursesInfoViewController.m
//  CoreDataHomeWork
//
//  Created by Кирилл on 10.03.17.
//  Copyright © 2017 Кирилл. All rights reserved.
//

#import "SKCoursesInfoViewController.h"
#import "SKCourse+CoreDataClass.h"
#import "SKSpheresViewController.h"
#import "SKStudent+CoreDataProperties.h"
#import "SKDataManager.h"
#import "SKCoursesViewController.h"
#import "SKCourseInfoCell.h"
#import "SKCourseSphereCell.h"
#import "SKLearningStudentCell.h"

@interface SKCoursesInfoViewController () <UIPopoverPresentationControllerDelegate, UITextFieldDelegate>

@property (strong, nonatomic) SKCourse *course;
@property (strong , nonatomic) NSArray *studentsArray;
@property (strong, nonatomic) NSMutableSet *selectedStudentsSet;

@end

typedef enum {
    
    SKNameRow,
    SKDisciplineRow,
    SKSphereRow,
    
} SKRow;

typedef enum {
    
    SKInformationSection,
    SKStudentsSection,
    
} SKSection;

static NSString *nameCellIdentifier = @"nameCell";
static NSString *sphereCellIdentifier = @"sphereCell";
static NSString *disciplineCellIdentifier = @"disciplineCell";
static NSString *studentCellIdentifier = @"studentCell";
static NSString *sphereSegueIdentifier = @"spheres";

@implementation SKCoursesInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.isEdit) {
        
        SKCoursesViewController *vc = self.coursesViewController;
        
        self.course = [vc.fetchedResultsController objectAtIndexPath:vc.indexPathForEdit];
        
        self.selectedStudentsSet = [NSMutableSet setWithSet:self.course.students];
    } else {
        self.selectedStudentsSet = [NSMutableSet set];
    }
    
    self.studentsArray = [[[[SKDataManager sharedManager] persistentContainer] viewContext]
                          executeFetchRequest:[SKStudent fetchRequest] error:nil];
    
    self.studentCells = [NSMutableArray array];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == SKStudentsSection) {
        [self.selectedStudentsSet addObject:[self.studentsArray objectAtIndex:indexPath.row]];
    }
}

- (void) tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == SKStudentsSection) {
        [self.selectedStudentsSet removeObject:[self.studentsArray objectAtIndex:indexPath.row]];
    }
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == SKStudentsSection) {
        
        return YES;
    }
    return NO;
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
    if ([textField isEqual:self.sphereCell.sphereTextField]) {
        [self performSegueWithIdentifier:sphereSegueIdentifier sender:textField];
        return NO;
    }
    return YES;
}

#pragma mark - UIPopoverPresentationControllerDelegate

- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller traitCollection:(UITraitCollection *)traitCollection {
    return UIModalPresentationNone;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section == SKInformationSection) {
         return 3;
    } else if (section == SKStudentsSection) {
        return [self.studentsArray count];
    } else {
        return 0;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    if (section == SKInformationSection) {
        return @"Course information";
    } else if (section == SKStudentsSection) {
        return @"Students on course";
    } else {
        return nil;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = nil;
    
    if (indexPath.section == SKInformationSection) {
        
        switch (indexPath.row) {
            case SKNameRow:
                cell = [tableView dequeueReusableCellWithIdentifier:nameCellIdentifier
                                                       forIndexPath:indexPath];
                
                self.nameCell = (SKCourseInfoCell *)cell;
                
                if (self.isEdit) {
                    self.nameCell.nameTextField.text = self.course.name;
                }
                
                return self.nameCell;
                
            case SKDisciplineRow:
                cell = [tableView dequeueReusableCellWithIdentifier:disciplineCellIdentifier
                                                       forIndexPath:indexPath];
                
                self.disciplineCell = (SKCourseInfoCell *)cell;

                if (self.isEdit) {
                    self.disciplineCell.disciplineTextField.text = self.course.discipline;
                }
                
                return self.disciplineCell;
                
            case SKSphereRow:
                cell = [tableView dequeueReusableCellWithIdentifier:sphereCellIdentifier
                                                             forIndexPath:indexPath];
                
                self.sphereCell = (SKCourseSphereCell *)cell;

                if (self.isEdit) {
                    self.sphereCell.sphereTextField.text = self.course.sphere;
                }
                
                return self.sphereCell;
            default:
                return nil;
        }
    } else if (indexPath.section == SKStudentsSection) {
        
        cell = [tableView dequeueReusableCellWithIdentifier:studentCellIdentifier
                                               forIndexPath:indexPath];
        
        SKLearningStudentCell *studentCell = (SKLearningStudentCell *)cell;
        
        SKStudent *student = [self.studentsArray objectAtIndex:indexPath.row];
        
        studentCell.textLabel.text = student.name;
        
        [self.studentCells addObject:studentCell];
        
        if (self.isEdit) {
            if ([self.selectedStudentsSet containsObject:student]) {
                studentCell.selected = YES;
            }
        }
        return studentCell;
    }
    
    return nil;
}

#pragma mark - Actions 

- (IBAction)cancelAction:(UIBarButtonItem *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)doneAction:(UIBarButtonItem *)sender {
    
    NSManagedObjectContext *context = [self.coursesViewController.fetchedResultsController managedObjectContext];
    
    if (!self.isEdit) {
        
        SKCourse *course = [[SKCourse alloc] initWithContext:context];
        
        course.name = self.nameCell.nameTextField.text;
        course.discipline = self.disciplineCell.disciplineTextField.text;
        course.sphere = self.sphereCell.sphereTextField.text;
        course.students = self.selectedStudentsSet;
        
    } else {
        
        self.course.name = self.nameCell.nameTextField.text;
        self.course.discipline = self.disciplineCell.disciplineTextField.text;
        self.course.sphere = self.sphereCell.sphereTextField.text;
        self.course.students = self.selectedStudentsSet;
    }
    
    // Save the context.
    NSError *error = nil;
    if (![context save:&error]) {
        NSLog(@"%@", [error localizedDescription]);
        abort();
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:sphereSegueIdentifier]) {
    
        SKSpheresViewController *vc = [segue destinationViewController];
        
        vc.delegate = self.sphereCell;
        
        vc.popoverPresentationController.delegate = self;
        
        UIPopoverPresentationController *popover = [vc popoverPresentationController];
        
        CGRect popoverRect = [sender convertRect:((UITextField *)sender).frame toView:self.tableView];
        
        popover.sourceView = self.tableView;
        popover.sourceRect = popoverRect;
    }
}

@end
