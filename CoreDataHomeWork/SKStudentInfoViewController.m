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
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
            self.nameCell = cell;
            
            return cell;
            
        case SKLastnameRow:
            cell = [tableView dequeueReusableCellWithIdentifier:lastnameCell
                                                   forIndexPath:indexPath];
            
            self.lastnameCell = cell;
            
            return cell;
            
        case SKEmailRow:
            cell = [tableView dequeueReusableCellWithIdentifier:emailCell
                                                   forIndexPath:indexPath];
            
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
    SKStudent *student = [[SKStudent alloc] initWithContext:context];
    
    // If appropriate, configure the new managed object.

    student.name = self.nameCell.nameTextField.text;
    student.lastname = self.lastnameCell.lastnameTextField.text;
    student.email = self.emailCell.emailTextField.text;
    
    // Save the context.
    NSError *error = nil;
    if (![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        
        abort();
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}
@end
