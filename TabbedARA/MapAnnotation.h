//
//  MapAnnotation.h
//  TabbedARA
//
//  Created by Eka Praditya GK on 6/3/14.
//  Copyright (c) 2014 Eka Praditya GK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MapAnnotation : NSObject <MKAnnotation>

@property (nonatomic, readonly)CLLocationCoordinate2D coordinate;
@property (readwrite, retain)NSString *titleText;
@property (readwrite, retain)NSString *subtitleText;

-(id)initWithCoordinate:(CLLocationCoordinate2D) coordinate;
-(NSString *)subtitle;
-(NSString *)title;
-(void)setTitle:(NSString *)strTitle;
-(void)setSubtitle:(NSString *)strSubtitle;
@end
