//
//  photoViewController.h
//  CameraUtil
//
//  Created by Eka Praditya GK on 6/8/14.
//  Copyright (c) 2014 Eka Praditya GK. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface photoViewController : UIViewController
<UINavigationControllerDelegate, UIImagePickerControllerDelegate, MFMailComposeViewControllerDelegate>

- (IBAction)loadPhotoPicker:(id)sender;

@end
