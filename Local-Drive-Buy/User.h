//
//  User.h
//  Local-Drive-Buy
//
//  Created by Raymond J. Oesch on 4/19/13.
//  Copyright (c) 2013 GVSU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "Constants.h"

@interface User : NSObject <MKAnnotation>

@property (strong, nonatomic) NSString * addr1;
@property (strong, nonatomic) NSString * addr2;
@property (strong, nonatomic) NSString * city;
@property (strong, nonatomic) NSString * state;
@property (strong, nonatomic) NSString * zip;
@property (strong, nonatomic) NSString * name;
@property (strong, nonatomic) NSString * imageaddress;
@property (strong, nonatomic) UIImage * image;
@property (strong, nonatomic) NSString * email;
@property (strong, nonatomic) NSString * phone;

@end
