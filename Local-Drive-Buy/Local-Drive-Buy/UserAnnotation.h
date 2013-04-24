//
//  UserAnnotation.h
//  Local-Drive-Buy
//
//  Created by Raymond J. Oesch on 4/22/13.
//  Copyright (c) 2013 GVSU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "Listing.h"

@interface UserAnnotation : NSObject <MKAnnotation>

@property (strong, nonatomic) NSString * title;
@property (strong, nonatomic) CLLocation * location;
@property (strong, nonatomic) NSMutableArray * listings;
@property (nonatomic) BOOL hasedible;
@property (nonatomic) BOOL hasbrewery;
@property (nonatomic) BOOL hasfarmersmarket;
@property (nonatomic) BOOL hasrestaurant;
@property (nonatomic) BOOL hasroadsidestand;
@property (nonatomic) BOOL hasupickorchard;
@property (nonatomic) BOOL hasgoods;
@property (nonatomic) BOOL hasarsandcrafts;
@property (nonatomic) BOOL hasclothing;
@property (nonatomic) BOOL hashealthandfitness;
@property (nonatomic) BOOL hasfurniture;
@property (nonatomic) BOOL hasother;
@property (strong, nonatomic) UIImage * image;
@property (nonatomic) CLLocationCoordinate2D coordinate;

- (UserAnnotation *) init_withlisting:(Listing *) listing;
- (void) addlisting:(Listing *) newlisting;

@end
