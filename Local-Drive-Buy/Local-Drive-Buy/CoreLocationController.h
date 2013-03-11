//
//  CoreLocationController.h
//  Local-Drive-Buy
//
//  Created by Raymond J. Oesch on 3/11/13.
//  Copyright (c) 2013 CQL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@protocol coreLocationControllerDelegate
@required

- (void) LocationUpdate:(CLLocation *) location;
- (void) LocationError:(NSError *) error;

@end

@interface CoreLocationController : NSObject <CLLocationManagerDelegate>
{
    CLLocationManager * locMgr;
    id delegate;
}

@property (nonatomic, retain) CLLocationManager * locMgr;
@property (nonatomic, retain) id delegate;

@end
