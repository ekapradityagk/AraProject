//
//  headingViewController.h
//  Gyro
//
//  Created by Eka Praditya GK on 6/7/14.
//  Copyright (c) 2014 Eka Praditya GK. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface headingViewController : UIViewController <CLLocationManagerDelegate>

@property (nonatomic, retain) IBOutlet CLLocationManager *locationManager;
@property (nonatomic, strong) IBOutlet UIImageView *compassImage;

@property (nonatomic, strong) IBOutlet UILabel *trueHeadingLabel;
@property (nonatomic, strong) IBOutlet UILabel *magneticHeadingLabel;

- (float)heading:(float)heading fromOrientation:(UIDeviceOrientation) orientation;

- (NSString *)stringFromOrientation:(UIDeviceOrientation) orientation;
@property (strong, nonatomic) IBOutlet UILabel *orientationLabel;

@end
