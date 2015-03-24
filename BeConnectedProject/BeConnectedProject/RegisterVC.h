//
//  RegisterVC.h
//  BeConnectedProject
//
//  Created by indianic on 26/02/15.
//  Copyright (c) 2015 indianic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterVC : UIViewController<UITextFieldDelegate>

{

    IBOutlet UIDatePicker *datePicker;
    IBOutlet UILabel *lblDOB;
    IBOutlet UITextField *txtConfirmPassword;
    IBOutlet UITextField *txtPassword;
    IBOutlet UITextField *txtEmailID;
    IBOutlet UISegmentedControl *segmentGender;
    IBOutlet UITextField *txtLastName;
    IBOutlet UITextField *txtFirstName;
}
- (IBAction)getDatePickerValue:(UIDatePicker *)sender;

- (IBAction)btnSubmitDetails:(UIButton *)sender;
@end
