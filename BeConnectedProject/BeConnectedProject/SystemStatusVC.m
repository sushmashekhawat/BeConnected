//
//  SystemStatusVC.m
//  BeConnectedProject
//
//  Created by indianic on 18/03/15.
//  Copyright (c) 2015 indianic. All rights reserved.
//

#import "SystemStatusVC.h"

@interface SystemStatusVC ()

@end

@implementation SystemStatusVC
@synthesize strNavigationTitle;
- (void)viewDidLoad {
    [super viewDidLoad];
     self.navigationItem.title=strNavigationTitle;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
