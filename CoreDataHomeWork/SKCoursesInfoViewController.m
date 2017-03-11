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

@interface SKCoursesInfoViewController () <UIPopoverPresentationControllerDelegate, UITextFieldDelegate>

@property (strong, nonatomic) SKCourse *course;

@end

typedef enum {
    
    SKNameRow,
    SKDisciplineRow,
    SKSphereRow,
    
} SKRow;

static NSString *nameCellIdentifier = @"nameCell";
static NSString *sphereCellIdentifier = @"sphereCell";
static NSString *disciplineCellIdentifier = @"disciplineCell";
static NSString *sphereSegueIdentifier = @"spheres";

@implementation SKCoursesInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.isEdit) {
        
        SKCoursesViewController *vc = self.coursesViewController;
        
        self.course = [vc.fetchedResultsController objectAtIndexPath:vc.indexPathForEdit];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SKCourseInfoCell *cell = nil;
    SKCourseSphereCell *sphereCell = nil;
    
    switch (indexPath.row) {
        case SKNameRow:
            cell = [tableView dequeueReusableCellWithIdentifier:nameCellIdentifier
                                                   forIndexPath:indexPath];
            if (self.isEdit) {
                cell.nameTextField.text = self.course.name;
            }
            
            self.nameCell = cell;
            
            return cell;
            
        case SKDisciplineRow:
            cell = [tableView dequeueReusableCellWithIdentifier:disciplineCellIdentifier
                                                   forIndexPath:indexPath];
            if (self.isEdit) {
                cell.disciplineTextField.text = self.course.discipline;
            }
            
            self.disciplineCell = cell;
            
            return cell;
            
        case SKSphereRow:
            sphereCell = [tableView dequeueReusableCellWithIdentifier:sphereCellIdentifier
                                                   forIndexPath:indexPath];
            if (self.isEdit) {
                sphereCell.sphereTextField.text = self.course.sphere;
            }
            
            self.sphereCell = sphereCell;
            
            return sphereCell;
            
        default:
            return nil;
    }
    
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
        
    } else {
        
        self.course.name = self.nameCell.nameTextField.text;
        self.course.discipline = self.disciplineCell.disciplineTextField.text;
        self.course.sphere = self.sphereCell.sphereTextField.text;
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
