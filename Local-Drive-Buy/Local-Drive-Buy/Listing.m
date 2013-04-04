//
//  Listing.m
//  Local-Drive-Buy
//
//  Created by Raymond J. Oesch on 3/29/13.
//  Copyright (c) 2013 GVSU. All rights reserved.
//

#import "Listing.h"

@implementation Listing

- (id)init_withdict:(NSDictionary *)info
{
    self = [super init];
    if (self)
    {
        _title = info[@"title"];
        _description = info[@"description"];
        _address1 = info[@"address1"];
        _address2 = info[@"address2"];
        _city = info[@"city"];
        _state = info[@"state"];
        _zip = info[@"zip"];
    }
    
    return self;
}

@end