//
//  SearchViewController.h
//  Local-Drive-Buy
//
//  Created by Raymond J. Oesch on 4/15/13.
//  Copyright (c) 2013 GVSU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewController.h"

@interface SearchViewController : UITableViewController

@property (nonatomic, strong) NSArray * objects;

@property (nonatomic, strong) DetailViewController * detailViewController;

@end
