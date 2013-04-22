//
//  UserAnnotation.h
//  Local-Drive-Buy
//
//  Created by Raymond J. Oesch on 4/22/13.
//  Copyright (c) 2013 GVSU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Listing.h"

@interface UserAnnotation : NSObject

@property (strong, nonatomic) NSString * name;
@property (strong, nonatomic) NSMutableArray * listings;
@property (nonatomic) BOOL hasedible;
@property (nonatomic) BOOL hasgoods;

- (UserAnnotation *) init_withlisting:(Listing *) listing;
- (void) addlisting:(Listing *) newlisting;

@end
