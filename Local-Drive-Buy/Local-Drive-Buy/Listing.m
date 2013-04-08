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
        if (self.address1 != @"")
        {
            NSString * addressstring = self.address1;
            CLGeocoder * geocoder = [[CLGeocoder alloc] init];
            if (self.address2 != @"")
            {
                addressstring = [addressstring stringByAppendingString:[@", " stringByAppendingString:self.address2]];
            }
            if (self.city != @"")
            {
                addressstring = [addressstring stringByAppendingString:[@", " stringByAppendingString:self.city]];
            }
            if (self.state != @"")
            {
                addressstring = [addressstring stringByAppendingString:[@", " stringByAppendingString:self.state]];
            }
            if (self.zip != @"")
            {
                addressstring = [addressstring stringByAppendingString:[@", " stringByAppendingString:self.zip]];
            }
            [geocoder geocodeAddressString:addressstring completionHandler:^(NSArray * placemarks, NSError * error)
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

- (NSString *)address1
{
    if (!_address1)
    {
        _address1 = @"";
    }
    return _address1;
}

- (NSString *)address2
{
    if(!_address2)
    {
        _address2 = @"";
    }
    return  _address2;
}

- (NSString *)city
{
    if(!_city)
    {
        _city = @"";
    }
    return _city;
}

- (NSString *)state
{
    if(!_state)
    {
        _state = @"";
    }
    return _state;
}

- (NSString *)zip
{
    if(!_zip)
    {
        _zip = @"";
    }
    return _zip;
}

@end