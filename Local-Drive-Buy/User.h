//
//  User.h
//  Local-Drive-Buy
//
//  Created by Raymond J. Oesch on 4/19/13.
//  Copyright (c) 2013 GVSU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface User : NSObject <MKAnnotation>

@property (strong, nonatomic) NSString * addr1;
@property (strong, nonatomic) NSString * addr2;
@property (strong, nonatomic) NSString * city;
@property (strong, nonatomic) NSString * state;
@property (strong, nonatomic) NSString * zip;
@property (nonatomic) CLLocationCoordinate2D coordinate;
@property (strong, nonatomic) NSString * name;
@property (strong, nonatomic) NSURL * imageaddress;
@property (strong, nonatomic) UIImage * image;
@property (strong, nonatomic) NSString * email;
@property (strong, nonatomic) NSString * phone;
@property (strong, nonatomic) NSMutableArray * listings;
@property (nonatomic) BOOL hasedible;
@property (nonatomic) BOOL hasgoods;

- (void) addlisting:(id) newlisting;

@end
