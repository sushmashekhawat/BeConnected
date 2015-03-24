//
//  LoginVC.h
//  BeConnectedProject
//
//  Created by indianic on 26/02/15.
//  Copyright (c) 2015 indianic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface LoginVC : UIViewController<UITextFieldDelegate>
{

    IBOutlet UITextField *txtPassword;
    IBOutlet UITextField *txtUsername;
    
}
- (IBAction)btnLoginSuccessTapped:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UIButton *btnForgotPasswordTapped;

@end
