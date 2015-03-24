//
//  ViewController.h
//  ParseDemoRegistration
//
//  Created by indianic on 17/03/15.
//  Copyright (c) 2015 indianic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface ViewController : UIViewController<CLLocationManagerDelegate>{
    CLLocation *myloaction;
    CLLocationManager *locationManager;
}
@property(nonatomic,weak)IBOutlet UIButton *btnSignUp;
@property(nonatomic,weak)IBOutlet UIButton *btnLogin;


-(IBAction)btnSignUpTapped:(UIButton *)sender;
-(IBAction)btnLoginTapped:(UIButton *)sender;

@end

