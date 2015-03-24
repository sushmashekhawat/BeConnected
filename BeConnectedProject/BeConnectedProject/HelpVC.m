//
//  HelpVC.m
//  BeConnectedProject
//
//  Created by indianic on 14/03/15.
//  Copyright (c) 2015 indianic. All rights reserved.
//

#import "HelpVC.h"
#import "AboutUsVC.h"
#import "ContactUsVC.h"
#import "SystemStatusVC.h"
#import "FAQVC.h"
#import "FeedbackVC.h"

@interface HelpVC ()

@end

@implementation HelpVC

- (void)viewDidLoad {
    [super viewDidLoad];
    arrHelpIndex=[NSArray arrayWithObjects:@"About",@"FAQ",@"System Status",@"Contact Us",@"Feedback", nil];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark setting tableviewdelegate Methods


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrHelpIndex.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *tblcell=(UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"helpCell" forIndexPath:indexPath];
//    UIImageView *imgview=(UIImageView *)[tblcell viewWithTag:1];
//    imgview.image=[UIImage imageNamed:@"resizegroup.png"];
    UILabel *lblName=(UILabel *)[tblcell viewWithTag:2];
    lblName.text=[NSString stringWithFormat:@"%@",[arrHelpIndex objectAtIndex:indexPath.row]];
    return tblcell;

    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
 
    switch (indexPath.row) {
        case 0:
        {
            [self performSegueWithIdentifier:@"AboutUsSegue" sender:nil];
            break;
        }
        case 1:
        {
            [self performSegueWithIdentifier:@"FAQSegue" sender:nil];
            break;
        }
        case 2:
        {
            UIAlertView *alertViewSystemStatus=[[UIAlertView alloc]initWithTitle:@"System Status" message:@"Be Connected is working properly" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            [alertViewSystemStatus show];
            //[self performSegueWithIdentifier:@"systemStatusSegue" sender:nil];
            break;
        }
        case 3:
        {
            
            [self performSegueWithIdentifier:@"contactUsSegue" sender:nil];
            break;
        }
        case 4:
        {
            UIAlertView *alertViewFeedback=[[UIAlertView alloc]initWithTitle:@"Feeback" message:@"Send Feedback using Email" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
            [alertViewFeedback show];
            //[self performSegueWithIdentifier:@"feedbackSegue" sender:nil];
            break;
        }

        default:
            break;
    }
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    //NSIndexPath *ind=[tableView indexPathForSelectedRow];
    if([segue.identifier isEqualToString:@"AboutUsSegue"])
    {
        AboutUsVC *abtVC=(AboutUsVC *)segue.destinationViewController;
        abtVC.strNavigationTitle=[NSString stringWithFormat:@"%@",[arrHelpIndex objectAtIndex:0]];
        //[self.navigationController pushViewController:abtVC animated:YES];
    }
    else if([segue.identifier isEqualToString:@"FAQSegue"])
    {
        FAQVC *faqVC=(FAQVC *)segue.destinationViewController;
        faqVC.strNavigationTitle=[NSString stringWithFormat:@"%@",[arrHelpIndex objectAtIndex:1]];
    }
    else if([segue.identifier isEqualToString:@"systemStatusSegue"])
    {
//        SystemStatusVC *systemStatusVC=(SystemStatusVC *)segue.destinationViewController;
//        systemStatusVC.strNavigationTitle=[NSString stringWithFormat:@"%@",[arrHelpIndex objectAtIndex:2]];
        
    }
    else if([segue.identifier isEqualToString:@"contactUsSegue"])
    {
        ContactUsVC *contactUsVC=(ContactUsVC *)segue.destinationViewController;
        contactUsVC.strNavigationTitle=[NSString stringWithFormat:@"%@",[arrHelpIndex objectAtIndex:3]];
    }
    else if([segue.identifier isEqualToString:@"feedbackSegue"])
    {
        FeedbackVC *feedbackVC=(FeedbackVC *)segue.destinationViewController;
        feedbackVC.strNavigationTitle=[NSString stringWithFormat:@"%@",[arrHelpIndex objectAtIndex:4]];
        //NSLog(@"%@",feedbackVC.strNavigationTitle);
        
    }
}


@end
