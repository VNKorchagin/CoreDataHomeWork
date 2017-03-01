//
//  SKStudentsViewController.h
//  CoreDataHomeWork
//
//  Created by Кирилл on 01.03.17.
//  Copyright © 2017 Кирилл. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SKStudent;

@interface SKStudentsViewController : UITableViewController

@property (strong, nonatomic) NSMutableArray<SKStudent *> *studentsArray;

@end
