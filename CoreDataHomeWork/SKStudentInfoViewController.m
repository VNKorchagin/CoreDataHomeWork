//
//  SKStudentInfoViewController.m
//  CoreDataHomeWork
//
//  Created by Кирилл on 01.03.17.
//  Copyright © 2017 Кирилл. All rights reserved.
//

#import "SKStudentInfoViewController.h"
#import "SKStudent+CoreDataClass.h"

@interface SKStudentInfoViewController ()

@property (strong, nonatomic) SKStudent *student;

@end

typedef enum {
    
    SKNameRow,
    SKLastnameRow,
    SKEmailRow,
    
} SKRow;

static NSString *nameCell = @"nameCell";
static NSString *lastnameCell = @"lastnameCell";
static NSString *emailCell = @"emailCell";


@implementation SKStudentInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    if (self.isEdit) {
        
        SKStudentsViewController *vc = self.studentViewController;
        
        self.student = [vc.fetchedResultsController objectAtIndexPath:vc.indexPathForEdit];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SKStudentInfoCell *cell = nil;
    

    switch (indexPath.row) {
        case SKNameRow:
            cell = [tableView dequeueReusableCellWithIdentifier:nameCell
                                                   forIndexPath:indexPath];
            if (self.isEdit) {
                cell.nameTextField.text = self.student.name;
            }
            
            self.nameCell = cell;
            
            return cell;
            
        case SKLastnameRow:
            cell = [tableView dequeueReusableCellWithIdentifier:lastnameCell
                                                   forIndexPath:indexPath];
            if (self.isEdit) {
                cell.lastnameTextField.text = self.student.lastname;
            }
            
            self.lastnameCell = cell;
            
            return cell;
            
        case SKEmailRow:
            cell = [tableView dequeueReusableCellWithIdentifier:emailCell
                                                   forIndexPath:indexPath];
            if (self.isEdit) {
                cell.emailTextField.text = self.student.email;
            }
            
            self.emailCell = cell;

            return cell;
            
        default:
            return cell;
    }
    
}

#pragma mark - Actions

- (IBAction)cancelAction:(UIBarButtonItem *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)doneAction:(UIBarButtonItem *)sender {
    
    NSManagedObjectContext *context = [self.studentViewController.fetchedResultsController managedObjectContext];
    
    if (!self.isEdit) {
        
        SKStudent *student = [[SKStudent alloc] initWithContext:context];

        student.name = self.nameCell.nameTextField.text;
        student.lastname = self.lastnameCell.lastnameTextField.text;
        student.email = self.emailCell.emailTextField.text;
        
    } else {
        
        self.student.name = self.nameCell.nameTextField.text;
        self.student.lastname = self.lastnameCell.lastnameTextField.text;
        self.student.email = self.emailCell.emailTextField.text;
        
    }
    
    // Save the context.
    NSError *error = nil;
    if (![context save:&error]) {
        abort();
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}
@end
