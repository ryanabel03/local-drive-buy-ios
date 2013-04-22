//
//  Listing.h
//  Local-Drive-Buy
//
//  Created by Raymond J. Oesch on 3/29/13.
//  Copyright (c) 2013 GVSU. All rights reserved.
//

#import "User.h"

@interface Listing : NSObject

@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) NSString * description;
@property (nonatomic, strong) NSString * category;
@property (nonatomic, strong) NSString * subcategory;
@property (nonatomic, strong) User * user;

@end
