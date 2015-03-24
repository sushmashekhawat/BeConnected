
//
//  LoginVC.m
//  BeConnectedProject
//
//  Created by indianic on 26/02/15.
//  Copyright (c) 2015 indianic. All rights reserved.
//

#import "LoginVC.h"

@interface LoginVC ()

@end

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [[self navigationController] setNavigationBarHidden:NO animated:YES];
    self.title = @"Login";
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                                                  forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.navigationBar.tintColor=[UIColor whiteColor];

//    self.navigationController.navigationBar.tintColor=[UIColor whiteColor];
//    self.navigationController.navigationBar.barTintColor=[UIColor blueColor];

    //self.navigationController.navigationBar.barTintColor=[UIColor grayColor];
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

- (IBAction)btnLoginSuccessTapped:(UIButton *)sender {
    [self performSegueWithIdentifier:@"tabbarLoginSegue" sender:self];
    
}

#pragma mark -
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"tabbarLoginSegue"]) {
//        self.title = @"";
//        self.navigationController.navigationItem.hidesBackButton = YES;
//        self.navigationItem.hidesBackButton = YES;
//        self.navigationController.navigationItem.
    }
}
@end
