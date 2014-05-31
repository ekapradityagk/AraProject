//
//  ARA_PViewController.m
//  Ara1
//
//  Created by Eka Praditya GK on 5/31/14.
//  Copyright (c) 2014 Eka Praditya GK. All rights reserved.
//

#import "ARA_PViewController.h"

@interface ARA_PViewController ()

@end

@implementation ARA_PViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self checkGyro];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)isGyroscopeAvailable
{
#ifdef __IPHONE_4_0
    CMMotionManager *motionManager = [[CMMotionManager alloc]init];
    BOOL gyroscopeAvailable = motionManager.gyroAvailable;
    return gyroscopeAvailable;
#else
    return NO
#endif
}

- (void)checkGyro
{
    if ([self isGyroscopeAvailable]) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"gyro"
                                                       message:@"Gyro is available"
                                                      delegate:self
                                             cancelButtonTitle:@"OK"
                                             otherButtonTitles:nil, nil];
        [alert show];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"gyro"
                                                       message:@"Gyro is not available"
                                                      delegate:self
                                             cancelButtonTitle:@"OK"
                                             otherButtonTitles:nil, nil];
        [alert show];
    }
}

- (void)checkCamera
{
    BOOL cameraAvailable = [UIImagePickerController isSourceTypeAvailable:(UIImagePickerControllerSourceTypeCamera)];
    
    BOOL frontCameraAvailable = [UIImagePickerController isSourceTypeAvailable:(UIImagePickerControllerCameraDeviceFront)];

    if (cameraAvailable) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Camera"
                                                        message:@"Camera Available"
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil, nil];
        [alert show];
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Camera"
                                                        message:@"Camera NOT Available"
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil, nil];
        [alert show];
    }
    
    if (frontCameraAvailable) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Camera"
                                                       message:@"Front Camera Available"
                                                      delegate:self
                                             cancelButtonTitle:@"OK"
                                             otherButtonTitles:nil, nil];
        [alert show];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"camera"
                                                       message:@"Front Camera Not Available"
                                                      delegate:self
                                             cancelButtonTitle:@"OK"
                                             otherButtonTitles:nil, nil];
        [alert show];
    }
}

- (void)checkGPS
{
    BOOL magnetometerAvailable = [CLLocationManager headingAvailable];
    
    if (magnetometerAvailable) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"magnetometer"
                                                       message:@"Magnetometer is Available"
                                                      delegate:self
                                             cancelButtonTitle:@"OK"
                                             otherButtonTitles:nil, nil];
        [alert show];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"magnetometer"
                                                       message:@"Magnetometer is not available"
                                                      delegate:self
                                             cancelButtonTitle:@"OK"
                                             otherButtonTitles:nil, nil];
        [alert show];
    }
}

- (void)checkSound
{
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    BOOL audioAvailable = audioSession.inputAvailable;
    
    if (audioAvailable) {
        UIAlertView *alertView =[[UIAlertView alloc]initWithTitle:@"sound"
                                                          message:@"Sound is Available"
                                                         delegate:self
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil, nil];
        [alertView show];
    }
    else
    {
        UIAlertView *alertView =[[UIAlertView alloc]initWithTitle:@"sound"
                                                           message:@"sound is not available"
                                                          delegate:self
                                                 cancelButtonTitle:@"OK"
                                                 otherButtonTitles:nil, nil];
        [alertView show];
    }
}

- (BOOL) isVideoCameraAvailable
{
    UIImagePickerController *picker = [[UIImagePickerController alloc]init];
    
    NSArray *sourceTypes = [UIImagePickerController availableMediaTypesForSourceType:picker.sourceType];
    
    if (![sourceTypes containsObject:(NSString *)kUTTypeMovie]) {
        return NO;
    }
    return YES;
}

- (void)checkVideo
{
    if ([self isVideoCameraAvailable]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"video"
                                                        message:@"Video is available"
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil, nil];
        [alert show];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"video"
                                                       message:@"Video is not Available"
                                                      delegate:self
                                             cancelButtonTitle:@"OK"
                                             otherButtonTitles:nil, nil];
        [alert show];
    }
}

@end
