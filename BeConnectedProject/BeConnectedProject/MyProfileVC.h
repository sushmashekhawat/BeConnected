//
//  MyProfileVC.h
//  BeConnectedProject
//
//  Created by indianic on 14/03/15.
//  Copyright (c) 2015 indianic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyProfileVC : UIViewController<UIImagePickerControllerDelegate,UIActionSheetDelegate>

{

    __weak IBOutlet UILabel *lblUsername;
    __weak IBOutlet UIImageView *imgProfilePicture;
}
- (IBAction)btnChangeProfilePicture:(UIButton *)sender;
- (IBAction)btnEditUserName:(UIButton *)sender;


@end
