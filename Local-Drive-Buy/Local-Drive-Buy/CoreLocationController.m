//
//  CoreLocationController.m
//  Local-Drive-Buy
//
//  Created by Raymond J. Oesch on 3/11/13.
//  Copyright (c) 2013 CQL. All rights reserved.
//

#import "CoreLocationController.h"

@implementation CoreLocationController

@synthesize locMgr, delegate;

- (id) init
{
    self = [super init];
    
    if (self != nil)
    {
        self.locMgr = [[CLLocationManager alloc] init];
        self.locMgr.delegate = self;
    }
    
    return self;
}

- (void) locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    if ([self.delegate conformsToProtocol:@protocol(coreLocationControllerDelegate)]) {
        [self.delegate LocationUpdate:newLocation];
    }
}

- (void) locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    if ([self.delegate conformsToProtocol:@protocol(coreLocationControllerDelegate)]) {
        [self.delegate LocationError:error];
    }
}

@end
