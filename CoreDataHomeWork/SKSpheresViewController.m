//
//  SKSpheresViewController.m
//  CoreDataHomeWork
//
//  Created by Кирилл on 11.03.17.
//  Copyright © 2017 Кирилл. All rights reserved.
//

#import "SKSpheresViewController.h"

@interface SKSpheresViewController ()

@end

static NSString *spheres[] = {  @"Computer Science", @"Chemistry", @"Physics", @"Earth sciences",
    @"Space science", @"Biology", @"Social Science",
    @"Engineering", @"Healthcare", @"Philosophy", @"History",
    @"Formal Science", @"Interdisciplinary Science"                 };

@implementation SKSpheresViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    if ([self.delegate.sphereTextField.text length] == 0) {
        self.delegate.sphereTextField.text = [self pickerView:self.spherePicker titleForRow:0 forComponent:0];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIPickerViewDataSource

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return sizeof(spheres) / sizeof(NSString *);
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

#pragma mark - UIPickerViewDelegate

- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component  {
    return spheres[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    self.delegate.sphereTextField.text = [self pickerView:pickerView titleForRow:row forComponent:component];
    self.delegate.selectedRow = row;
}

@end
