//
//  SKCoursesInfoViewController.h
//  CoreDataHomeWork
//
//  Created by Кирилл on 10.03.17.
//  Copyright © 2017 Кирилл. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SKCoursesViewController.h"
#import "SKCourseInfoCell.h"
#import "SKCourseSphereCell.h"

@interface SKCoursesInfoViewController : UITableViewController

@property (weak, nonatomic) SKCoursesViewController *coursesViewController;

@property (weak, nonatomic) SKCourseInfoCell *nameCell;
@property (weak, nonatomic) SKCourseInfoCell *disciplineCell;
@property (weak, nonatomic) SKCourseSphereCell *sphereCell;

@property (assign, nonatomic) BOOL isEdit;

- (IBAction)cancelAction:(UIBarButtonItem *)sender;
- (IBAction)doneAction:(UIBarButtonItem *)sender;


@end
