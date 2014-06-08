//
//  SecondViewController.m
//  Gyro
//
//  Created by Eka Praditya GK on 6/6/14.
//  Copyright (c) 2014 Eka Praditya GK. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    //self.motionManager = [[[CMMotionManager alloc] init] autorelease];
    [self checkGyro];
    [self whatShouldCalledInDidLoad];
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)whatShouldCalledInDidLoad
{
    _motionManager.deviceMotionUpdateInterval = 1.0/60.0;
    NSLog(@" %hhd", _motionManager.isDeviceMotionAvailable);
    if (_motionManager.isDeviceMotionAvailable) {
        [_motionManager startDeviceMotionUpdates];
        [_motionManager startGyroUpdates];
        timer = [NSTimer scheduledTimerWithTimeInterval:1/30.0
                                                 target:self
                                               selector:@selector(doGyroUpdate)
                                               userInfo:nil
                                                repeats:YES];
        
    }

}

- (void)checkGyro
{
    Class motionManagerClass = NSClassFromString(@"CMMotionManager");
    if (motionManagerClass)
    {
        _motionManager = [[motionManagerClass alloc] init];
    }
    else
    {
        NSLog(@"CMMotionManager not available");
    }
}

- (void)doGyroUpdate
{
    [self bacaGyro];
}

- (void)readGyroscope
{
    [self bacaGyro];
}
- (void)bacaGyro {
    CMDeviceMotion *currentDeviceMotion =  _motionManager.deviceMotion;
    CMAttitude *currentAttitude = currentDeviceMotion.attitude;
    
    NSLog(@"Attitude: %@", currentAttitude);
    
    _rollLabel.text = [NSString stringWithFormat:@"Roll : %f", currentAttitude.roll];
    _rollProgressView.progress = ABS(currentAttitude.roll);
    _pitchLabel.text = [NSString stringWithFormat:@"Pitch : %f", currentAttitude.pitch];
    _pitchProgressView.progress = ABS(currentAttitude.pitch);
    _yawLabel.text = [NSString stringWithFormat:@"Yaw : %f", currentAttitude.yaw];
    _yawProgressView.progress = ABS(currentAttitude.yaw);
    
    
    
}


- (void)dealloc
{
    _motionManager = nil;
    _rollLabel = nil;
    _pitchLabel = nil;
    _yawLabel = nil;
    
    _rollProgressView = nil;
    _pitchProgressView = nil;
    _yawProgressView = nil;
}
@end
