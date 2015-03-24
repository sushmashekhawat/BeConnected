//
//  FAQVC.m
//  BeConnectedProject
//
//  Created by indianic on 18/03/15.
//  Copyright (c) 2015 indianic. All rights reserved.
//

#import "FAQVC.h"

@interface FAQVC ()

@end

@implementation FAQVC
@synthesize strNavigationTitle;
- (void)viewDidLoad {
    [super viewDidLoad];
    mutArrayFAQQuestions=[[NSMutableArray alloc]initWithObjects:@"How do I register an account with Be connected?",@"Is Beconnected Free?",@"Does Beconnected require a mobile data connection?",@"How do I invite more friends to Be connected?",@"How many friends can I invite?",@"Can I use Be connected outside India",@"How do i share a File?",@"What file types and size does Be connected supports?",@"How do I update my status on Be Connected?",@"What if I forgot my Password?",@"Can't Find What you need?", nil];
    
     self.navigationItem.title=strNavigationTitle;
    // Do any additional setup after loading the view.
}


#pragma mark setting tableview delegates methods
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 7;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *tblCell=(UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"faqVCCell" forIndexPath:indexPath];
    UILabel *lblQuestion=(UILabel *)[tblCell viewWithTag:1];
    //lblQuestion.textColor=[UIColor blueColor];
    lblQuestion.text=[mutArrayFAQQuestions objectAtIndex:indexPath.row];
    //lblQuestion.textColor=[UIColor blueColor];
    return tblCell;
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
