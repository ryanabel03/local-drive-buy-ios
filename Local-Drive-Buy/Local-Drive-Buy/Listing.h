//
//  Listing.h
//  Local-Drive-Buy
//
//  Created by Raymond J. Oesch on 3/29/13.
//  Copyright (c) 2013 GVSU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface Listing : NSObject

@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) NSAttributedString * description;
@property (nonatomic, strong) NSString * address1;
@property (nonatomic, strong) NSString * address2;
@property (nonatomic, strong) NSString * city;
@property (nonatomic, strong) NSString * state;
@property (nonatomic, strong) NSString * zip;
@property (nonatomic, strong) CLLocation * location;

- (id)init_withdict: (NSDictionary *) info;

@end
