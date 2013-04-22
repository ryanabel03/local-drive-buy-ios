//
//  User.m
//  Local-Drive-Buy
//
//  Created by Raymond J. Oesch on 4/19/13.
//  Copyright (c) 2013 GVSU. All rights reserved.
//

#import "User.h"

@implementation User

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
        NSURL * imageurl = [[NSURL alloc] initWithString:[WEBAPPPATH stringByAppendingString:self.imageaddress]];
        _image = [[UIImage alloc] initWithData:[[NSData alloc] initWithContentsOfURL:imageurl]];
        NSLog(@"%@", imageurl);
    }
    return _image;
}

@end
