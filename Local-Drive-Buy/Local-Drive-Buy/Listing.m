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
        _address = info[@"address"];
        _category = info[@"category"];
        _subcategory = info[@"subcategory"];
        if (self.address != @"")
        {
            CLGeocoder * geocoder = [[CLGeocoder alloc] init];
            [geocoder geocodeAddressString:_address completionHandler:^(NSArray * placemarks, NSError * error)
             {
                 if (placemarks[0])
                 {
                     CLPlacemark * possiblelocation = [[CLPlacemark alloc] initWithPlacemark:placemarks[0]];
                     _coordinate = CLLocationCoordinate2DMake(possiblelocation.location.coordinate.latitude, possiblelocation.location.coordinate.longitude);
                 }
             }];
        }
    }
    
    return self;
}

- (NSString *)address
{
    if (!_address)
    {
        _address = @"";
    }
    return _address;
}

@end