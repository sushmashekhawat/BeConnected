//
//  RegisterVC.m
//  BeConnectedProject
//
//  Created by indianic on 26/02/15.
//  Copyright (c) 2015 indianic. All rights reserved.
//

#import "RegisterVC.h"

@interface RegisterVC ()

@end

@implementation RegisterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [[self navigationController]setNavigationBarHidden:NO animated:YES];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                                                  forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.navigationBar.tintColor=[UIColor whiteColor];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark setting textfield delegate methods
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;

}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)getDatePickerValue:(UIDatePicker *)sender {
    lblDOB.text=[NSString stringWithFormat:@"%@",datePicker.date];
    //datePicker.hidden=YES;
    
}

- (IBAction)btnSubmitDetails:(UIButton *)sender {
    NSLog(@"%@\n%@\n%@\n%@\n%@\n%@\n",txtFirstName.text,txtLastName.text,txtEmailID.text,txtPassword.text,[segmentGender titleForSegmentAtIndex:segmentGender.selectedSegmentIndex],lblDOB.text);
}
@end
