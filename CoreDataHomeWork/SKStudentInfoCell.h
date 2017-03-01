//
//  SKStudentInfoCell.h
//  CoreDataHomeWork
//
//  Created by Кирилл on 01.03.17.
//  Copyright © 2017 Кирилл. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SKStudentInfoCell : UITableViewCell <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *lastnameTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;

@end
