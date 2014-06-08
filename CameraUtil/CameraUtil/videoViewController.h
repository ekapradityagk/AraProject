//
//  videoViewController.h
//  CameraUtil
//
//  Created by Eka Praditya GK on 6/8/14.
//  Copyright (c) 2014 Eka Praditya GK. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <ImageIO/CGImageProperties.h>

@interface videoViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIView *videoPreview;
@property (nonatomic, strong) AVCaptureStillImageOutput *stillImageOutput;
@property (nonatomic, strong) IBOutlet UIImageView *videoImage;

- (IBAction)captureScreen:(id)sender;

@end
