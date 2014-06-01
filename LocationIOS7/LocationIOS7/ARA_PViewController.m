//
//  ARA_PViewController.m
//  LocationIOS7
//
//  Created by Eka Praditya GK on 6/1/14.
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
    _LocationManager =[[CLLocationManager alloc]init];
    _LocationManager.desiredAccuracy = kCLLocationAccuracyBest;
    _LocationManager.delegate = self;
    [_LocationManager startUpdatingLocation];
    _startLocation = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)reset:(id)sender {
    NSLog(@"im fucking work");
    _startLocation = nil;
}

#pragma mark - 
#pragma mark CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSString *currentLatitude = [[NSString alloc]initWithFormat:@"%+.6f",newLocation.coordinate.latitude];
    _latitude.text = currentLatitude;
    
    NSString *currentLongitude = [[NSString alloc]initWithFormat:@"%+.6f",newLocation.coordinate.longitude];
    _longitude.text = currentLongitude;
    
    NSString *currentHorizontalAccuracy = [[NSString alloc]initWithFormat:@"%+.6f",newLocation.horizontalAccuracy];
    _horizontalAccuracy.text = currentHorizontalAccuracy;
    
    NSString *currentAltitude  = [[NSString alloc]initWithFormat:@"%+.6f", newLocation.altitude];
    _altitude.text = currentAltitude;
    
    NSString *currentVerticalAccuracy = [[NSString alloc]initWithFormat:@"%+.6f", newLocation.verticalAccuracy];
    _verticalAccuracy.text = currentVerticalAccuracy;
    
    if (_startLocation == nil) {
        _startLocation = newLocation;
    }
    
    CLLocationDistance distanceBetween = [newLocation distanceFromLocation:_startLocation];
    
    NSString *tripString = [[NSString alloc]initWithFormat:@"%f",distanceBetween];
    _distance.text =tripString;
}

@end
