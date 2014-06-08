//
//  FirstViewController.m
//  Gyro
//
//  Created by Eka Praditya GK on 6/6/14.
//  Copyright (c) 2014 Eka Praditya GK. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()
            

@end

@implementation FirstViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    /*
    curentMaxAccelX = 0;
    curentMaxAccelY = 0;
    curentMaxAccelZ = 0;
    
    currentMaxRotX = 0;
    currentMaxRotY = 0;
    currentMaxRotZ = 0;
    
    self.motionManager = [[CMMotionManager alloc] init];
    self.motionManager.accelerometerUpdateInterval = .2;
    self.motionManager.gyroUpdateInterval = .2;
    
    [self.motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue currentQueue]
                                             withHandler:^(CMAccelerometerData *accelerometerData, NSError *error) {
    [self outputAccelerationData:accelerometerData.acceleration];
                                                 if (error) {
                                                     NSLog(@"%@", error);
                                                 }
                                             }];
    
    [self.motionManager startGyroUpdatesToQueue:[NSOperationQueue currentQueue]
                                    withHandler:^(CMGyroData *gyroData, NSError *error) {
                                        [self outputRotationData:gyroData.rotationRate];
                                    }];
    */
    
    
    accelerometer = [UIAccelerometer sharedAccelerometer];
    accelerometer.updateInterval = .5;
    accelerometer.delegate = self;
    
    
}
/*
- (void)outputAccelerationData:(CMAcceleration)acceleration
{
    self.accX.text = [NSString stringWithFormat:@" %.2fg",acceleration.x];
    if (fabs(acceleration.x) > fabs(curentMaxAccelX)) {
        curentMaxAccelX = acceleration.x;
    }
    
    self.accY.text = [NSString stringWithFormat:@" %.2fg",acceleration.y];
    if (fabs(acceleration.y) > fabs(curentMaxAccelY)) {
        curentMaxAccelY = acceleration.y;
    }
    
    self.accZ.text = [NSString stringWithFormat:@" %.2fg",acceleration.z];
    if (fabs(acceleration.z) > fabs(curentMaxAccelZ)) {
        curentMaxAccelZ = acceleration.z;
    }
    
    self.maxAccX.text = [NSString stringWithFormat:@" %.2f", curentMaxAccelX];
    self.maxAccY.text = [NSString stringWithFormat:@" %.2f", curentMaxAccelY];
    self.maxAccZ.text = [NSString stringWithFormat:@" %.2f", curentMaxAccelZ];

}

- (void)outputRotationData:(CMRotationRate)rotation
{
    self.rotX.text = [NSString stringWithFormat:@" %2.fr/s",rotation.x];
    if (fabs(rotation.x) > fabs(currentMaxRotX)) {
        currentMaxRotX = rotation.x;
    }
    
    self.rotY.text = [NSString stringWithFormat:@" %2.fr/s",rotation.y];
    if (fabs(rotation.y) > fabs(currentMaxRotY)) {
        currentMaxRotY = rotation.y;
    }
    
    self.rotZ.text = [NSString stringWithFormat:@" %2.fr/s",rotation.z];
    if (fabs(rotation.z) > fabs(currentMaxRotZ)) {
        currentMaxRotZ = rotation.z;
    }
    
    self.maxRotX.text = [NSString stringWithFormat:@" %.2f", currentMaxRotX];
    self.maxRotY.text = [NSString stringWithFormat:@" %.2f", currentMaxRotY];
    self.maxRotZ.text = [NSString stringWithFormat:@" %.2f", currentMaxRotZ];
}

- (IBAction)resetMaxValues:(id)sender
{
    curentMaxAccelX = 0;
    curentMaxAccelY = 0;
    curentMaxAccelZ = 0;
    
    currentMaxRotX = 0;
    currentMaxRotY = 0;
    currentMaxRotZ = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
*/
- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration
{
    
    double const kThreshold = 2.0;
    if (ABS(acceleration.x) > kThreshold || ABS(acceleration.y) > kThreshold || ABS(acceleration.z) > kThreshold) {
        NSLog(@"shake detected !!" );
    }
    _xLabel.text = [NSString stringWithFormat:@"%@ %f", @"X : " , acceleration.x];
    _yLabel.text = [NSString stringWithFormat:@"%@ %f", @"Y : " , acceleration.y];
    _zLabel.text = [NSString stringWithFormat:@"%@ %f", @"Z : " , acceleration.z];
    
    _xProgressView.progress = ABS(acceleration.x);
    _yProgressView.progress = ABS(acceleration.y);
    _zProgressView.progress = ABS(acceleration.z);
    
}

- (void)dealloc
{
    
    _xLabel = nil;
    _yLabel = nil;
    _zLabel = nil;
    
    _xProgressView = nil;
    _yProgressView = nil;
    _zProgressView = nil;
    
}
@end
