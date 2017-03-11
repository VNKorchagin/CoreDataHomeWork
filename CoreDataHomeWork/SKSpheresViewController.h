//
//  SKSpheresViewController.h
//  CoreDataHomeWork
//
//  Created by Кирилл on 11.03.17.
//  Copyright © 2017 Кирилл. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SKSpheresProtocol <NSObject>

@property (weak, nonatomic) IBOutlet UITextField *sphereTextField;
@property (assign, nonatomic) NSInteger selectedRow;

@end

@interface SKSpheresViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UIPickerView *spherePicker;
@property (weak, nonatomic) id <SKSpheresProtocol> delegate;

@end
