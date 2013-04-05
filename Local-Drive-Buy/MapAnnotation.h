//
//  MapAnnotation.h
//  Local-Drive-Buy
//
//  Created by Raymond J. Oesch on 4/5/13.
//  Copyright (c) 2013 GVSU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MapAnnotation : NSObject <MKAnnotation>

@property (nonatomic, readonly) CLLocationCoordinate2D location;

-(id)init_withlocation: (CLLocationCoordinate2D) cord;

@end
