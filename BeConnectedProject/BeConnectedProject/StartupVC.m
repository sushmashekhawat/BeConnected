//
//  StartupVC.m
//  BeConnectedProject
//
//  Created by indianic on 26/02/15.
//  Copyright (c) 2015 indianic. All rights reserved.
//

#import "StartupVC.h"
#import "LoginVC.h"
#import "RegisterVC.h"
@interface StartupVC ()

@end

@implementation StartupVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[self navigationController]setNavigationBarHidden:YES animated:YES];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated
{
    [[self navigationController]setNavigationBarHidden:YES animated:YES];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btnLoginTapped:(UIButton *)sender {
    
//    LoginVC *objLoginVC=[self.storyboard instantiateViewControllerWithIdentifier:@"LoginVC"];
//    [self.navigationController pushViewController:objLoginVC animated:YES];

    [self performSegueWithIdentifier:@"LoginVC" sender:self];
}

- (IBAction)btnSignupTapped:(UIButton *)sender {
//    RegisterVC *objRegisterVC=[self.storyboard instantiateViewControllerWithIdentifier:@"RegisterVC"];
//    [self.navigationController pushViewController:objRegisterVC animated:YES];
    [self performSegueWithIdentifier:@"RegisterVC" sender:self];

}
@end
