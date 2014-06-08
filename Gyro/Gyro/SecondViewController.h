//
//  SecondViewController.h
//  Gyro
//
//  Created by Eka Praditya GK on 6/6/14.
//  Copyright (c) 2014 Eka Praditya GK. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

@interface SecondViewController : UIViewController
{
    NSTimer *timer;
}



@property (nonatomic, retain) CMMotionManager *motionManager;
@property (strong, nonatomic) IBOutlet UILabel *rollLabel;
@property (strong, nonatomic) IBOutlet UILabel *pitchLabel;
@property (strong, nonatomic) IBOutlet UILabel *yawLabel;


@property (strong, nonatomic) IBOutlet UIProgressView *rollProgressView;
@property (strong, nonatomic) IBOutlet UIProgressView *pitchProgressView;
@property (strong, nonatomic) IBOutlet UIProgressView *yawProgressView;

- (IBAction)readGyroscope;
@end

