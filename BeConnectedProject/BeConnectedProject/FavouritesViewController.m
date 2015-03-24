//
//  FavouritesViewController.m
//  BeConnectedProject
//
//  Created by iDev on 15/12/1936 SAKA.
//  Copyright (c) 1936 SAKA indianic. All rights reserved.
//

#import "FavouritesViewController.h"

@interface FavouritesViewController ()

@end

@implementation FavouritesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.hidesBackButton=YES;
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
    UITableViewCell *tblCell=(UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"favouritesCell" forIndexPath:indexPath];
    UIImageView *imgView=(UIImageView *)[tblCell viewWithTag:1];
    imgView.image=[UIImage imageNamed:@"cloudupload.png"];
    UILabel *lblName=(UILabel *)[tblCell viewWithTag:2];
    lblName.text=@"favourite Name";
    UILabel *lblStatus=(UILabel *)[tblCell viewWithTag:3];
    lblStatus.text=@"Status";
    
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
