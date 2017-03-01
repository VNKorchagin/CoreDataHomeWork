//
//  SKStudentInfoCell.m
//  CoreDataHomeWork
//
//  Created by Кирилл on 01.03.17.
//  Copyright © 2017 Кирилл. All rights reserved.
//

#import "SKStudentInfoCell.h"

@implementation SKStudentInfoCell 

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [self.nameTextField resignFirstResponder];
    [self.lastnameTextField resignFirstResponder];
    [self.emailTextField resignFirstResponder];
    
    return YES;
}

@end
