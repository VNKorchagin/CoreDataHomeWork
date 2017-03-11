//
//  SKCourseSphereCell.h
//  CoreDataHomeWork
//
//  Created by Кирилл on 11.03.17.
//  Copyright © 2017 Кирилл. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SKSpheresViewController.h"

@interface SKCourseSphereCell : UITableViewCell <SKSpheresProtocol>

@property (assign, nonatomic) NSInteger selectedRow;
@property (weak, nonatomic) IBOutlet UITextField *sphereTextField;

@end
