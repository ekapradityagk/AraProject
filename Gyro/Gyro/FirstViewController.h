//
//  FirstViewController.h
//  Gyro
//
//  Created by Eka Praditya GK on 6/6/14.
//  Copyright (c) 2014 Eka Praditya GK. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

/*
double curentMaxAccelX;
double curentMaxAccelY;
double curentMaxAccelZ;

double currentMaxRotX;
double currentMaxRotY;
double currentMaxRotZ;

@interface FirstViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *accX;
@property (strong, nonatomic) IBOutlet UILabel *accY;
@property (strong, nonatomic) IBOutlet UILabel *accZ;

@property (strong, nonatomic) IBOutlet UILabel *maxAccX;
@property (strong, nonatomic) IBOutlet UILabel *maxAccY;
@property (strong, nonatomic) IBOutlet UILabel *maxAccZ;

@property (strong, nonatomic) IBOutlet UILabel *rotX;
@property (strong, nonatomic) IBOutlet UILabel *rotY;
@property (strong, nonatomic) IBOutlet UILabel *rotZ;

@property (strong, nonatomic) IBOutlet UILabel *maxRotX;
@property (strong, nonatomic) IBOutlet UILabel *maxRotY;
@property (strong, nonatomic) IBOutlet UILabel *maxRotZ;

- (IBAction)resetMaxValues:(id)sender;

@property (strong, nonatomic) CMMotionManager *motionManager;
 */
 //Cara ibook
@interface FirstViewController : UIViewController <UIAccelerometerDelegate>
{
    UIAccelerometer *accelerometer;
    
    UILabel *xLabel;
    UILabel *yLabel;
    UILabel *zLabel;
    
    UIProgressView *xProgressView;
    UIProgressView *yProgressView;
    UIProgressView *zProgressView;
}

@property (nonatomic, retain) UIAccelerometer *acccelerometer;

@property (nonatomic, retain) IBOutlet UILabel *xLabel;
@property (nonatomic, retain) IBOutlet UILabel *yLabel;
@property (nonatomic, retain) IBOutlet UILabel *zLabel;

@property (nonatomic, retain) IBOutlet UIProgressView *xProgressView;
@property (nonatomic, retain) IBOutlet UIProgressView *yProgressView;
@property (nonatomic, retain) IBOutlet UIProgressView *zProgressView;

@end

