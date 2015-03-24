//
//  ContactUsVC.h
//  BeConnectedProject
//
//  Created by indianic on 18/03/15.
//  Copyright (c) 2015 indianic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContactUsVC : UIViewController<UITextFieldDelegate,UIImagePickerControllerDelegate>
{
    __weak IBOutlet UITextField *txtProblem;
    
    __weak IBOutlet UIImageView *imgScreenshotProblem3;
    __weak IBOutlet UIImageView *imgScreenshotProblem;
    __weak IBOutlet UIImageView *imgScreenshotProblem2;
}

@property(nonatomic,retain)NSString *strNavigationTitle;

- (IBAction)uploadScreenShot1:(UIButton *)sender;
- (IBAction)uploadScreenShot2:(UIButton *)sender;
- (IBAction)uploadScreenShot3:(UIButton *)sender;
- (IBAction)submitProblem:(UIButton *)sender;
@end
