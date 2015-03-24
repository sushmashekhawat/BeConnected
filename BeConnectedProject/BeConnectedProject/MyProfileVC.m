//
//  MyProfileVC.m
//  BeConnectedProject
//
//  Created by indianic on 14/03/15.
//  Copyright (c) 2015 indianic. All rights reserved.
//

#import "MyProfileVC.h"

@interface MyProfileVC ()

@end

@implementation MyProfileVC

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *btnLogout=[[UIBarButtonItem alloc]initWithTitle:@"Logout" style:UIBarButtonItemStylePlain target:self action:@selector(btnLogoutClicked)];
    self.navigationItem.rightBarButtonItem=btnLogout;
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)btnLogoutClicked
{

}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnChangeProfilePicture:(UIButton *)sender
{
    UIActionSheet *actionSheetImagePicker=[[UIActionSheet alloc]initWithTitle:@"Photo Options" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Capture From Camera",@"Select From gallery",nil];
    [actionSheetImagePicker showInView:self.view];
}


-(void)takePhotoMode:(BOOL)isFromCamera{
    
    if (isFromCamera && ![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                              message:@"Device has no camera"
                                                             delegate:nil
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles: nil];
        
        [myAlertView show];
        return;
        
    }
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = (id)self;
    picker.allowsEditing = YES;
    picker.sourceType = isFromCamera?UIImagePickerControllerSourceTypeCamera:UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:picker animated:YES completion:NULL];
    
}



#pragma actionsheet Delegate Methods

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
            [self takePhotoMode:YES];
            break;
            
        case 1:
            [self takePhotoMode:NO];
            
        default:
            break;
    }

}

#pragma image picker delegate methods
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *chosenImage=info[UIImagePickerControllerEditedImage];
    imgProfilePicture.image=chosenImage;
    [picker dismissViewControllerAnimated:YES completion:nil];
}



- (IBAction)btnEditUserName:(UIButton *)sender {
}
@end
