//
//  headingViewController.m
//  Gyro
//
//  Created by Eka Praditya GK on 6/7/14.
//  Copyright (c) 2014 Eka Praditya GK. All rights reserved.
//

#import "headingViewController.h"

@interface headingViewController ()

@end

@implementation headingViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _locationManager = [[CLLocationManager alloc]init];
    
    _locationManager.delegate = self;
    //locationManager.headingFilter = 5;
    
    if ([CLLocationManager locationServicesEnabled] && [CLLocationManager headingAvailable]) {
        [_locationManager startUpdatingLocation];
        [_locationManager startUpdatingHeading];
    }
    else NSLog(@"salah satu ga enabled");
}

- (void)locationManager:(CLLocationManager *)manager
       didUpdateHeading:(CLHeading *)newHeading
{
    NSLog(@"masuk");
    if (newHeading.headingAccuracy > 0) {
        //float magneticHeading = newHeading.magneticHeading;
        //float trueHeading = newHeading.trueHeading;
        UIDevice *device = [UIDevice currentDevice];
        _orientationLabel.text = [self stringFromOrientation:device.orientation];
        
        float magneticHeading = [self heading:newHeading.magneticHeading fromOrientation:device.orientation];
        float trueHeading = [self heading:newHeading.trueHeading fromOrientation:device.orientation];
        
        _magneticHeadingLabel.text = [NSString stringWithFormat:@"%f", magneticHeading];
        _trueHeadingLabel.text = [NSString stringWithFormat:@" %f", trueHeading];
        
        float heading = -1.0f * M_PI * newHeading.magneticHeading / 180.0f;
        _compassImage.transform = CGAffineTransformMakeRotation(heading);
    }
}

- (float)heading:(float)heading
 fromOrientation:(UIDeviceOrientation)orientation
{
    float correctedHeading = heading;
    switch (orientation) {
        case UIDeviceOrientationPortrait:
            break;
        case UIDeviceOrientationPortraitUpsideDown:
            correctedHeading = heading + 180.0f;
            break;
        case UIDeviceOrientationLandscapeLeft:
            correctedHeading = heading + 90.0f;
            break;
        case UIDeviceOrientationLandscapeRight:
            correctedHeading = heading - 90.0f;
            break;
        default:
            break;
    }
    while (heading > 360.0f) {
        correctedHeading = heading - 360;
    }
    return correctedHeading;
}

- (NSString *)stringFromOrientation:(UIDeviceOrientation)orientation
{
    NSString *orientationString;
    switch (orientation) {
        case UIDeviceOrientationPortrait:
            orientationString = @"Potrait";
            break;
        case UIDeviceOrientationPortraitUpsideDown:
            orientationString = @"Potrait Upside Down";
            break;
        case UIDeviceOrientationLandscapeLeft:
            orientationString = @"Landscape Left";
            break;
        case UIDeviceOrientationLandscapeRight:
            orientationString = @"Landscape Right";
            break;
        case UIDeviceOrientationFaceUp:
            orientationString = @"Face Up";
            break;
        case UIDeviceOrientationFaceDown:
            orientationString = @"Face Down";
            break;
        case UIDeviceOrientationUnknown:
            orientationString = @"Unknown";
            break;
        default:
            orientationString = @"Not Known";
            break;
    }
    return orientationString;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
