//
//  AccountVC.m
//  BeConnectedProject
//
//  Created by indianic on 14/03/15.
//  Copyright (c) 2015 indianic. All rights reserved.
//

#import "AccountVC.h"

@interface AccountVC ()

@end

@implementation AccountVC

- (void)viewDidLoad {
    [super viewDidLoad];
    arrAccountIndex=[NSArray arrayWithObjects:@"Change Email ID",@"Change Password",@"Network Usage",@"Backup Account",@"Reset Account",@"Delete Account", nil];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark setting tableviewdelegate Methods


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrAccountIndex.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *tblcell=(UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"accountCell" forIndexPath:indexPath];
    //    UIImageView *imgview=(UIImageView *)[tblcell viewWithTag:1];
    //    imgview.image=[UIImage imageNamed:@"resizegroup.png"];
    UILabel *lblName=(UILabel *)[tblcell viewWithTag:2];
    lblName.text=[NSString stringWithFormat:@"%@",[arrAccountIndex objectAtIndex:indexPath.row]];
    return tblcell;
    
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
            [self performSegueWithIdentifier:@"ChangeEmailSegue" sender:nil];
            break;
        }
        case 1:
        {
            [self performSegueWithIdentifier:@"ChangePasswordSegue" sender:nil];
            break;
        
        }
        case 2:
        {
            [self performSegueWithIdentifier:@"NetworkUsageSegue" sender:nil];
            break;
        }
        case 3:
        {
            [self performSegueWithIdentifier:@"BackUpAccountSegue" sender:nil];
            break;
        }
        case 4:
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Reset Account" message:@"Are you sure you want to reset account?\n Note: It will delete all the data" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
            [alert show];
            break;
        
        }
        case 5:
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Delete Account" message:@"Are you sure you want to delete account?\n Note: It will delete the account permanently " delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
            [alert show];
            [self performSegueWithIdentifier:@"DeleteAccountSegue" sender:nil];
            break;
        }
        default:
            break;
    }
}
@end
