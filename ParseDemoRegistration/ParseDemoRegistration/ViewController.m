//
//  ViewController.m
//  ParseDemoRegistration
//
//  Created by indianic on 17/03/15.
//  Copyright (c) 2015 indianic. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getLocation];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) getLocation{

    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    //locationManager.distanceFilter = kCLDistanceFilterNone;
    [locationManager startUpdatingLocation];
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) {
        if ([locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
            [locationManager requestWhenInUseAuthorization];
        }
    }
    
}
- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{
    myloaction = newLocation;
    [locationManager stopUpdatingLocation];
    [locationManager setDelegate:nil];
    locationManager = nil;
}

-(IBAction)btnSignUpTapped:(UIButton *)sender{
    PFUser *userInfo = [PFUser new];
    userInfo[@"user_id"] = [NSNumber numberWithInt:10];//number
    userInfo[@"firstname"] = @"Ashwin1";
    userInfo[@"lastname"] = @"Kanjariya1";
    userInfo.email = @"ashwin.kanjariya@indianic3.com";
    userInfo.username = @"ashwin.kanjariya@indianic3.com";
    userInfo.password = @"indianic1";
    userInfo[@"phoneNo"] = @"9722143957";
    userInfo[@"gender"] = @"Male";
    userInfo[@"status"] = @"Active";
    userInfo[@"birthdate"] = [NSDate date];
    NSData *imageData = UIImagePNGRepresentation([UIImage imageNamed:@"9.png"]);
    PFFile *imageFile = [PFFile fileWithName:@"img" data:imageData];
    userInfo[@"userimage"] = imageFile;
    if (myloaction) {
        PFGeoPoint *loc = [[PFGeoPoint alloc] init];
        loc.latitude= myloaction.coordinate.latitude;
        loc.longitude = myloaction.coordinate.longitude;
        userInfo[@"location"] = loc;
    }

    [userInfo signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!succeeded) {
            NSLog(@"error %@",error);
        }
    }];
}

-(IBAction)btnLoginTapped:(UIButton *)sender{
    [PFUser logInWithUsernameInBackground:@"ashwin.kanjariya@indianic1.com" password:@"indianic" block:^(PFUser *user, NSError *error) {
        if (error) {
            NSLog(@"%@",error);
        }
        else{
            NSLog(@"%@",user);
        }
        
    }];
}

/*
 -(IBAction)btnSignUpTapped:(UIButton *)sender{
 PFObject *userReg = [PFObject objectWithClassName:@"Users"];
 userReg[@"id"] = @1;
 userReg[@"firstname"] = @"Ashwin";
 userReg[@"lastname"] = @"Kanjariya";
 userReg[@"useremail"] = @"ashwin.kanjariya@indianic.com";
 userReg[@"password"] = @"indianic";
 userReg[@"phoneNo"] = @"9722143957";
 userReg[@"gender"] = @"Male";
 userReg[@"status"] = @"Active";
 userReg[@"birthdate"] = [NSDate date];
 NSData *imageData = UIImagePNGRepresentation([UIImage imageNamed:@"9.png"]);
 PFFile *imageFile = [PFFile fileWithName:@"img" data:imageData];
 userReg[@"userimage"] = imageFile;
 if (myloaction) {
 PFGeoPoint *loc = [[PFGeoPoint alloc] init];
 loc.latitude= myloaction.coordinate.latitude;
 loc.longitude = myloaction.coordinate.longitude;
 userReg[@"location"] = loc;
 }
 [userReg saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
 if (succeeded) {
 // The object has been saved.
 } else {
 // There was a problem, check error.description
 }
 }];
 }
 
 -(IBAction)btnLoginTapped:(UIButton *)sender{
 PFQuery *query = [PFQuery queryWithClassName:@"Users"];
 [query whereKey:@"useremail" containsString:@"ashwin.kanjariya@indianic.com"];
 [query whereKey:@"password" containsString:@"indianic1"];
 
 PFObject *userinfo = [query getFirstObject];
 NSLog(@"%@", userinfo);
 
 //    [query getObjectInBackgroundWithId:@"eG53PF1ojn" block:^(PFObject *userinfo, NSError *error) {
 //        // Do something with the returned PFObject in the gameScore variable.
 //        NSLog(@"%@", userinfo);
 //    }];
 }

 */
@end
