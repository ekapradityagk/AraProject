//
//  ARA_PSecondViewController.h
//  TabbedARA
//
//  Created by Eka Praditya GK on 6/1/14.
//  Copyright (c) 2014 Eka Praditya GK. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "MapAnnotation.h"

@interface ARA_PSecondViewController : UIViewController <MKReverseGeocoderDelegate>

@property (nonatomic, retain)IBOutlet MKMapView *mapView;
@property (nonatomic, retain)IBOutlet UISegmentedControl *buttonSegmentedControl;
@property CLLocationCoordinate2D coords;

@end
