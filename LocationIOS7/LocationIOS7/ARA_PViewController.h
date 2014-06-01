//
//  ARA_PViewController.h
//  LocationIOS7
//
//  Created by Eka Praditya GK on 6/1/14.
//  Copyright (c) 2014 Eka Praditya GK. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ARA_PViewController : UIViewController
    <CLLocationManagerDelegate>
@property (strong, nonatomic) IBOutlet UILabel *latitude;
@property (strong, nonatomic) IBOutlet UILabel *longitude;
@property (strong, nonatomic) IBOutlet UILabel *horizontalAccuracy;
@property (strong, nonatomic) IBOutlet UILabel *altitude;
@property (strong, nonatomic) IBOutlet UILabel *verticalAccuracy;
@property (strong, nonatomic) IBOutlet UILabel *distance;

@property (strong, nonatomic) CLLocationManager *LocationManager;
@property (strong, nonatomic) CLLocation *startLocation;
- (IBAction)reset:(id)sender;
@end
