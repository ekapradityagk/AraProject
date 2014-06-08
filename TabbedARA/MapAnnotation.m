//
//  MapAnnotation.m
//  TabbedARA
//
//  Created by Eka Praditya GK on 6/3/14.
//  Copyright (c) 2014 Eka Praditya GK. All rights reserved.
//

#import "MapAnnotation.h"

@implementation MapAnnotation

- (NSString *)subtitle
{
    return _subtitleText;
}

- (NSString *)title
{
    return _titleText;
}

- (void)setTitle:(NSString *)strTitle
{
    self.titleText = strTitle;
}

-(void)setSubtitle:(NSString *)strSubtitle
{
    self.subtitleText = strSubtitle;
}

-(id)initWithCoordinate:(CLLocationCoordinate2D)c
{
    _coordinate = c;
    return self;
}
@end
