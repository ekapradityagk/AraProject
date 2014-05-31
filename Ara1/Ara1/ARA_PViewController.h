//
//  ARA_PViewController.h
//  Ara1
//
//  Created by Eka Praditya GK on 5/31/14.
//  Copyright (c) 2014 Eka Praditya GK. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MobileCoreServices/UTCoreTypes.h>
#import <CoreMotion/CoreMotion.h>
#import <AVFoundation/AVFoundation.h>

@interface ARA_PViewController : UIViewController

- (BOOL) isVideoCameraAvailable;
- (BOOL) isGyroscopeAvailable;

@end
