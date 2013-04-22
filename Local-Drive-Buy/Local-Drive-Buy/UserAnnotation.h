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
@property (nonatomic) CLLocationCoordinate2D coordinate;
@property (strong, nonatomic) NSMutableArray * listings;
@property (nonatomic) BOOL hasedible;
@property (nonatomic) BOOL hasgoods;
@property (strong, nonatomic) UIImage * image;

- (UserAnnotation *) init_withlisting:(Listing *) listing;
- (void) addlisting:(Listing *) newlisting;

@end
