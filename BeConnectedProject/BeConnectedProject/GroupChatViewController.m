//
//  GroupChatViewController.m
//  BeConnectedProject
//
//  Created by iDev on 15/12/1936 SAKA.
//  Copyright (c) 1936 SAKA indianic. All rights reserved.
//

#import "GroupChatViewController.h"

@interface GroupChatViewController ()

@end

@implementation GroupChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.hidesBackButton=YES;
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
    UITableViewCell *tblcell=(UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"groupChatCell" forIndexPath:indexPath];
    UIImageView *imgview=(UIImageView *)[tblcell viewWithTag:1];
    imgview.image=[UIImage imageNamed:@"group.png"];
    UILabel *lblName=(UILabel *)[tblcell viewWithTag:2];
    lblName.text=@"Name";
    UILabel *lblMsgHidden=(UILabel *)[tblcell viewWithTag:3];
    lblMsgHidden.text=@"Message";
    return tblcell;
    
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
