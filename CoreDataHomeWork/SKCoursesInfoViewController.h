//
//  SKCoursesInfoViewController.h
//  CoreDataHomeWork
//
//  Created by Кирилл on 10.03.17.
//  Copyright © 2017 Кирилл. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SKCoursesViewController;
@class SKCourseInfoCell;
@class SKCourseSphereCell;
@class SKLearningStudentCell;

@interface SKCoursesInfoViewController : UITableViewController 
@property (weak, nonatomic) SKCoursesViewController *coursesViewController;

@property (weak, nonatomic) SKCourseInfoCell *nameCell;
@property (weak, nonatomic) SKCourseInfoCell *disciplineCell;
@property (weak, nonatomic) SKCourseSphereCell *sphereCell;
@property (strong, nonatomic) NSMutableArray<SKLearningStudentCell *> *studentCells;


@property (assign, nonatomic) BOOL isEdit;

- (IBAction)cancelAction:(UIBarButtonItem *)sender;
- (IBAction)doneAction:(UIBarButtonItem *)sender;


@end
