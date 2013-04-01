//
//  MasterViewController.h
//  Local-Drive-Buy
//
//  Created by Raymond J. Oesch on 4/1/13.
//  Copyright (c) 2013 GVSU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <RestKit/RestKit.h>
#import "DetailViewController.h"

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController * detailViewController;

@end
