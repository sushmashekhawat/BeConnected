//
//  NetworkUsageVC.m
//  BeConnectedProject
//
//  Created by indianic on 18/03/15.
//  Copyright (c) 2015 indianic. All rights reserved.
//

#import "NetworkUsageVC.h"

@interface NetworkUsageVC ()

@end

@implementation NetworkUsageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    arrTitles=[[NSMutableArray alloc]initWithObjects:@"Messages Sent:",@"Messages Received:",@"Media Bytes Sent:",@"Media Bytes Received:",@"Message Bytes Sent:",@"Message Bytes Received:",@"Total Bytes Sent:",@"Total Bytes Received:",@"Reset Statistics",nil];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark setting tableview delegates methods
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 7;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *tblCell=(UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"networkUsageCell" forIndexPath:indexPath];
    UILabel *lblTitle=(UILabel *)[tblCell viewWithTag:1];
    lblTitle.text=[arrTitles objectAtIndex:indexPath.row];
    UILabel *lblSubtitle=(UILabel *)[tblCell viewWithTag:2];
    lblSubtitle.text=@"Data in the form of bytes";
    return tblCell;
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
