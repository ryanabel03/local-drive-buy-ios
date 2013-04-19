//
//  User.m
//  Local-Drive-Buy
//
//  Created by Raymond J. Oesch on 4/19/13.
//  Copyright (c) 2013 GVSU. All rights reserved.
//

#import "User.h"
#import "Listing.h"

@implementation User

- (CLLocationCoordinate2D) coordinate
{
    if (!CLLocationCoordinate2DIsValid(_coordinate))
    {
        if (self.addr1 != @"")
        {
            NSString * address = [self.addr1 stringByAppendingString:[@" " stringByAppendingString:[self.addr2 stringByAppendingString:[@", " stringByAppendingString:[self.city stringByAppendingString:[@", " stringByAppendingString:[self.state stringByAppendingString:[@", " stringByAppendingString:self.zip]]]]]]]];
            CLGeocoder * geocoder = [[CLGeocoder alloc] init];
            [geocoder geocodeAddressString:address completionHandler:^(NSArray * placemarks, NSError * error)
             {
                 if (placemarks[0])
                 {
                     CLPlacemark * possiblelocation = [[CLPlacemark alloc] initWithPlacemark:placemarks[0]];
                     _coordinate = CLLocationCoordinate2DMake(possiblelocation.location.coordinate.latitude, possiblelocation.location.coordinate.longitude);
                 }
             }];
        }
    }
    return _coordinate;
}

- (NSString *) addr1
{
    if (!_addr1)
    {
        _addr1 = @"";
    }
    return _addr1;
}

- (NSString *) addr2
{
    if (!_addr2)
    {
        _addr2 = @"";
    }
    return _addr2;
}

- (NSString *) city
{
    if (!_city)
    {
        _city = @"";
    }
    return _city;
}

- (NSString *) state
{
    if (!_state)
    {
        _state = @"";
    }
    return _state;
}

- (UIImage *) image
{
    if (!_image)
    {
        _image = [[UIImage alloc] initWithData:[[NSData alloc] initWithContentsOfURL:self.imageaddress]];
    }
    return  _image;
}

-(void) addlisting:(id)nl
{
    Listing * newlisting = nl;
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
