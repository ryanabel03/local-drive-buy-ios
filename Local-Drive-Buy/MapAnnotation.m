//
//  MapAnnotation.m
//  Local-Drive-Buy
//
//  Created by Raymond J. Oesch on 4/5/13.
//  Copyright (c) 2013 GVSU. All rights reserved.
//

#import "MapAnnotation.h"

@implementation MapAnnotation

-(id)init_withlocation:(CLLocationCoordinate2D)cord
{
    self = [super init];
    
    if (self)
    {
        _location = cord;
    }
    
    return self;
}

@end
