//
//  SKStudentInfoViewController.h
//  CoreDataHomeWork
//
//  Created by Кирилл on 01.03.17.
//  Copyright © 2017 Кирилл. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SKStudentsViewController.h"
#import "SKStudentInfoCell.h"
#import "SKStudent.h"

@interface SKStudentInfoViewController : UITableViewController

@property (weak, nonatomic) SKStudentsViewController *studentViewController;

@property (weak, nonatomic) SKStudentInfoCell *nameCell;
@property (weak, nonatomic) SKStudentInfoCell *lastnameCell;
@property (weak, nonatomic) SKStudentInfoCell *emailCell;


- (IBAction)cancelAction:(UIBarButtonItem *)sender;
- (IBAction)doneAction:(UIBarButtonItem *)sender;

@end
