//
//  ChatViewController.m
//  BeConnectedProject
//
//  Created by iDev on 15/12/1936 SAKA.
//  Copyright (c) 1936 SAKA indianic. All rights reserved.
//

#import "ChatViewController.h"

@interface ChatViewController ()

@end

@implementation ChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBarController.navigationItem.hidesBackButton = YES;
    
    //[[self navigationController]setNavigationBarHidden:YES animated:YES];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark setting tableviewdelegate Methods


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 7;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *tblcell=(UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"chatCell" forIndexPath:indexPath];
    UIImageView *imgview=(UIImageView *)[tblcell viewWithTag:1];
    imgview.image=[UIImage imageNamed:@"resizegroup.png"];
    UILabel *lblName=(UILabel *)[tblcell viewWithTag:2];
    lblName.text=@"Name";
    UILabel *lblMsgHidden=(UILabel *)[tblcell viewWithTag:3];
    lblMsgHidden.text=@"Message";
    return tblcell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch(indexPath.row)
    {
        default:
        {
            [self performSegueWithIdentifier:@"individualChat" sender:nil];
            break;
        }

    }
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

}


@end
