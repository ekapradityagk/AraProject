//
//  ARA_PFirstViewController.h
//  TabbedARA
//
//  Created by Eka Praditya GK on 6/1/14.
//  Copyright (c) 2014 Eka Praditya GK. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ARA_PFirstViewController : UIViewController <CLLocationManagerDelegate>


@property (nonatomic,strong) IBOutlet UITextView *locationTextView;
@property (strong,nonatomic) CLLocationManager *locationManager;
@property (strong,nonatomic) CLLocation *startLocation;


-(void)startStandarUpdates;
-(void)startSignificantChangeUpdates;



@end
