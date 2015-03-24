//
//  SettingsVC.m
//  BeConnectedProject
//
//  Created by indianic on 14/03/15.
//  Copyright (c) 2015 indianic. All rights reserved.
//

#import "SettingsVC.h"
#import "ChatSettingsVC.h"
#import "MediaVC.h"
#import "ContactsVC.h"
#import "PrivacyVC.h"

@interface SettingsVC ()

@end

@implementation SettingsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    arrSettingsIndex=[NSArray arrayWithObjects:@"Chat Settings",@"Media",@"Privacy",@"Contacts", nil];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark setting tableviewdelegate Methods
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrSettingsIndex.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *tblcell=(UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"settingsCell" forIndexPath:indexPath];
    //    UIImageView *imgview=(UIImageView *)[tblcell viewWithTag:1];
    //    imgview.image=[UIImage imageNamed:@"resizegroup.png"];
    UILabel *lblName=(UILabel *)[tblcell viewWithTag:2];
    lblName.text=[NSString stringWithFormat:@"%@",[arrSettingsIndex objectAtIndex:indexPath.row]];
    return tblcell;
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    switch (indexPath.row) {
        case 0:
        {
            [self performSegueWithIdentifier:@"ChatSettingsSegue" sender:nil];
            break;
        }
        case 1:
        {
            [self performSegueWithIdentifier:@"MediaSegue" sender:nil];
            break;
        }
        case 2:
        {
            [self performSegueWithIdentifier:@"PrivacySegue" sender:nil];
            break;
        }
        case 3:
        {
            [self performSegueWithIdentifier:@"ContactsSegue" sender:nil];
            break;
        }
        default:
            break;
    }
    
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
 
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"ChatSettingsSegue"])
    {
        ChatSettingsVC *chatsettingsVC=segue.destinationViewController;
        chatsettingsVC.strNavigationTitle=[NSString stringWithFormat:@"%@",[arrSettingsIndex objectAtIndex:0]];
    }
    else if([segue.identifier isEqualToString:@"MediaSegue"])
    {
        MediaVC *mediaVC=segue.destinationViewController;
        mediaVC.strNavigationTitle=[NSString stringWithFormat:@"%@",[arrSettingsIndex objectAtIndex:1]];
    }
    else if([segue.identifier isEqualToString:@"PrivacySegue"])
    {
        PrivacyVC *privacyVC=segue.destinationViewController;
        privacyVC.strNavigationTitle=[NSString stringWithFormat:@"%@",[arrSettingsIndex objectAtIndex:2]];
    }
    else if([segue.identifier isEqualToString:@"ContactsSegue"])
    {
        ContactsVC *contactsVC=segue.destinationViewController;
        contactsVC.strNavigationTitle=[NSString stringWithFormat:@"%@",[arrSettingsIndex objectAtIndex:3]];
    }
}


@end
