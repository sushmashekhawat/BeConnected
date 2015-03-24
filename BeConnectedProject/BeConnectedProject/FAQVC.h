//
//  FAQVC.h
//  BeConnectedProject
//
//  Created by indianic on 18/03/15.
//  Copyright (c) 2015 indianic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FAQVC : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *mutArrayFAQQuestions;
}
@property(nonatomic,retain)NSString *strNavigationTitle;

@end
