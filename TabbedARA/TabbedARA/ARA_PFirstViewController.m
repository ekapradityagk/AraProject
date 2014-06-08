//
//  ARA_PFirstViewController.m
//  TabbedARA
//
//  Created by Eka Praditya GK on 6/1/14.
//  Copyright (c) 2014 Eka Praditya GK. All rights reserved.
//

#import "ARA_PFirstViewController.h"

@interface ARA_PFirstViewController ()

@end

@implementation ARA_PFirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self startSignificantChangeUpdates];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"masuk ga sih");
    NSDate *eventDate = newLocation.timestamp;
    //NSTimeInterval howRecent = [eventDate timeIntervalSinceNow];
    //if (abs(howRecent)<15.0) {
      //  NSLog(@"kayaknya ga masuk kesini");
        NSString *locationNow = [NSString stringWithFormat:@"Latitude is %+.6f\n Longitude is %+.6f", newLocation.coordinate.latitude, newLocation.coordinate.longitude];
        _locationTextView.text = locationNow;
    //}
}

- (void)startStandarUpdates
{
    _locationManager =[[CLLocationManager alloc]init];
    _locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
    _locationManager.distanceFilter = 10;
    _locationManager.delegate = self;
    [_locationManager startUpdatingLocation];
    _startLocation = nil;
}

- (void)startSignificantChangeUpdates
{
    _locationManager = [[CLLocationManager alloc]init];
    _locationManager.delegate = self;
    [_locationManager startMonitoringSignificantLocationChanges];
    _startLocation = nil;
}

- (void)dealloc
{
    _locationTextView = nil;
}

@end
