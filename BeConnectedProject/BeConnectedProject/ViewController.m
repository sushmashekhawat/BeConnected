//
//  ViewController.m
//  BeConnectedProject
//
//  Created by indianic on 26/02/15.
//  Copyright (c) 2015 indianic. All rights reserved.
//

#import "ViewController.h"
#import "StartupVC.h"


@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *imgSplashScreen;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self performSelector:@selector(pushNewScreen) withObject:nil afterDelay:2.0];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)viewWillAppear:(BOOL)animated
{
    [[self navigationController]setNavigationBarHidden:YES animated:YES];
}


-(void)pushNewScreen
{
    StartupVC *objStartUpVC=[self.storyboard instantiateViewControllerWithIdentifier:@"StartupVC"];
    [self.navigationController pushViewController:objStartUpVC animated:YES];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
