//
//  Listing.h
//  Local-Drive-Buy
//
//  Created by Raymond J. Oesch on 3/29/13.
//  Copyright (c) 2013 GVSU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "User.h"

@interface Listing : NSObject <MKAnnotation>

@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) NSString * description;
@property (nonatomic, strong) NSString * address;
@property (nonatomic, strong) NSString * category;
@property (nonatomic, strong) NSString * subcategory;
@property (nonatomic) CLLocationCoordinate2D coordinate;
@property (nonatomic, strong) NSURL * imageaddress;
@property (nonatomic, strong) UIImage * image;
@property (nonatomic, strong) User * user;

- (id)init_withdict: (NSDictionary *) info;

@end
