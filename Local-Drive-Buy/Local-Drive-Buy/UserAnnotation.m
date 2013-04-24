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
    
    _title = listing.user.name;
    _image = listing.user.image;
    _listings = [[NSMutableArray alloc] init];
    [self addlisting:listing];
    
    return self;
}

-(void) addlisting:(Listing *)newlisting
{
    [self.listings addObject:newlisting];
    if ([newlisting.category isEqualToString:@"Edibles"])
    {
        self.hasedible = TRUE;
    }
    else if ([newlisting.category isEqualToString:@"Goods"])
    {
        self.hasgoods = TRUE;
    }
    else if ([newlisting.subcategory isEqualToString:@"Restaurant"]){
        self.hasrestaurant = TRUE;
    }
    else if ([newlisting.category isEqualToString:@"Brewery / Winery"]){
        self.hasbrewery = TRUE;
    }
    else if ([newlisting.category isEqualToString:@"U-Pick / Orchard"])
    {
        self.hasupickorchard = TRUE;
    }
    else if ([newlisting.subcategory isEqualToString:@"Farmer's Market"]){
        self.hasfarmersmarket = TRUE;
    }
    else if ([newlisting.category isEqualToString:@"Brewery / Winery"]){
        self.hasbrewery = TRUE;
    }
    else if ([newlisting.category isEqualToString:@"Arts & Crafts"])
    {
        self.hasarsandcrafts = TRUE;
    }
    else if ([newlisting.subcategory isEqualToString:@"Clothing"]){
        self.hasclothing = TRUE;
    }
    else if ([newlisting.category isEqualToString:@"Health & Fitness"]){
        self.hashealthandfitness = TRUE;
    }
    else if ([newlisting.category isEqualToString:@"Furniture"])
    {
        self.hasfurniture = TRUE;
    }
    else if ([newlisting.subcategory isEqualToString:@"Other"]){
        self.hasother = TRUE;
    }    
}

- (CLLocationCoordinate2D) coordinate
{
    if (_coordinate.latitude == 0 && _coordinate.longitude == 0)
    {
        Listing * l = self.listings[0];
        if (l.user.addr1 != @"")
        {
            NSString * address = [l.user.addr1 stringByAppendingString:[@" " stringByAppendingString:[l.user.addr2 stringByAppendingString:[@", " stringByAppendingString:[l.user.city stringByAppendingString:[@", " stringByAppendingString:[l.user.state stringByAppendingString:[@", " stringByAppendingString:l.user.zip]]]]]]]];
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

@end
