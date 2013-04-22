//
//  UserAnnotation.m
//  Local-Drive-Buy
//
//  Created by Raymond J. Oesch on 4/22/13.
//  Copyright (c) 2013 GVSU. All rights reserved.
//

#import "UserAnnotation.h"

@implementation UserAnnotation

-(UserAnnotation *) init_withlisting:(Listing *)listing
{
    self = [super init];
    
    _name = listing.user.name;
    [self addlisting:listing];
    
    return self;
}

-(void) addlisting:(Listing *)newlisting
{
    [self.listings addObject:newlisting];
    if ([newlisting.category isEqualToString:@"Edible"])
    {
        self.hasedible = TRUE;
    }
    else if ([newlisting.category isEqualToString:@"Goods"])
    {
        self.hasgoods = TRUE;
    }
}

@end
