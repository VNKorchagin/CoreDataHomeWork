//
//  SKStudentInfoViewController.m
//  CoreDataHomeWork
//
//  Created by Кирилл on 01.03.17.
//  Copyright © 2017 Кирилл. All rights reserved.
//

#import "SKStudentInfoViewController.h"

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


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Actions

- (IBAction)cancelAction:(UIBarButtonItem *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)doneAction:(UIBarButtonItem *)sender {
    
    SKStudent *newStudent = [[SKStudent alloc] init];
    
    newStudent.name = self.nameCell.nameTextField.text;
    newStudent.lastname = self.lastnameCell.lastnameTextField.text;
    newStudent.email = self.emailCell.emailTextField.text;
    
    [self.studentViewController.studentsArray addObject:newStudent];
    
    [self.navigationController popViewControllerAnimated:YES];
}
@end
