//
//  ARA_PSecondViewController.m
//  TabbedARA
//
//  Created by Eka Praditya GK on 6/1/14.
//  Copyright (c) 2014 Eka Praditya GK. All rights reserved.
//

#import "ARA_PSecondViewController.h"

@interface ARA_PSecondViewController ()

@end

@implementation ARA_PSecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _mapView.delegate = self;
    [self.view addSubview:_mapView];
    [NSThread detachNewThreadSelector:@selector(displayMap) toTarget:self withObject:nil];
    [self setupSegmentedControl];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

- (void)displayMap
{
    //NSAutoreleasePool *pool =[[NSAutoreleasePool alloc]init];
    //CLLocationCoordinate2D coords;
    _coords.latitude = 3.147129;
    _coords.longitude = 101.708894;
    MKCoordinateSpan span = MKCoordinateSpanMake(0.002389, 0.005681);
    MKCoordinateRegion region = MKCoordinateRegionMake(_coords, span);
    MapAnnotation *addAnnotation = [[MapAnnotation alloc]initWithCoordinate:_coords];
    [addAnnotation setTitle:@"My Annotation Title"];
    [addAnnotation setSubtitle:@"this is subtitle"];
    [_mapView addAnnotation:addAnnotation];
    [_mapView setRegion:region animated:YES];
}

- (void)setupSegmentedControl
{
    _buttonSegmentedControl = [[UISegmentedControl alloc]initWithItems:[NSArray arrayWithObjects:@"standard", @"Satellite", @"Hybrid", nil]];
    [_buttonSegmentedControl setFrame:CGRectMake(30, 50, 280-30, 30)];
    _buttonSegmentedControl.selectedSegmentIndex = 0.0;
    
    [_buttonSegmentedControl addTarget:self action:@selector(toggleToolBarChange:) forControlEvents:UIControlEventValueChanged];
    _buttonSegmentedControl.segmentedControlStyle = UIScrollViewIndicatorStyleWhite;
    _buttonSegmentedControl.backgroundColor = [UIColor clearColor];
    _buttonSegmentedControl.tintColor = [UIColor blackColor];
    [_buttonSegmentedControl setAlpha:0.8];
    
    [self.view addSubview:_buttonSegmentedControl];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    MKPinAnnotationView *annView = [[MKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:@"MY Pin"];
    annView.animatesDrop=TRUE;
    annView.canShowCallout = YES;
    [annView setSelected:YES];
    annView.pinColor = MKPinAnnotationColorPurple;
    annView.calloutOffset = CGPointMake(-50, 5);
    return annView;
}

- (void)toggleToolBarChange:(id)sender
{
    UISegmentedControl *segControl = sender;
    switch (segControl.selectedSegmentIndex) {
        case 0:
            [_mapView setMapType:MKMapTypeStandard];
            break;
        case 1:
        {
            //[_mapView setMapType:MKMapTypeSatellite];
            //CLLocationCoordinate2D coords;
            //coords.latitude = 37.33188;
            //coords.longitude = -122.029497;
            MKReverseGeocoder *geoCoder = [[MKReverseGeocoder alloc] initWithCoordinate:_coords];
            [geoCoder setDelegate:self];
            [geoCoder start];
            [_mapView setMapType:MKMapTypeSatellite];
            break;
        }
        case 2:
            [_mapView setMapType:MKMapTypeHybrid];
            break;
        default:
            break;
    }
}

- (void) reverseGeocoder:(MKReverseGeocoder *)geocoder didFindPlacemark:(MKPlacemark *)placemark
{
    NSLog(@"Return...%@ ", placemark.addressDictionary );
    NSLog(@"coord is %f, %f", _coords.longitude, _coords.latitude);
    
}

- (void) reverseGeocoder:(MKReverseGeocoder *)geocoder didFailWithError:(NSError *)error
{
    NSLog(@"Fail... %@", error);
}

- (void)dealloc
{
    _mapView = nil;
}
@end
