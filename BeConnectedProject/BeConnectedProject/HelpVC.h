//
//  HelpVC.h
//  BeConnectedProject
//
//  Created by indianic on 14/03/15.
//  Copyright (c) 2015 indianic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HelpVC : UIViewController<UITableViewDataSource,UITableViewDelegate>

{
    IBOutlet UITableView *tableViewdata;
    NSArray *arrHelpIndex;
}
@end
