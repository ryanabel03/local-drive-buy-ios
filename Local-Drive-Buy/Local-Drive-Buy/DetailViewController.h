//
//  DetailViewController.h
//  Local-Drive-Buy
//
//  Created by Raymond J. Oesch on 4/1/13.
//  Copyright (c) 2013 GVSU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Listing.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) Listing * detailItem;

@property (weak, nonatomic) IBOutlet UILabel *descriptionlabel;

@property (weak, nonatomic) IBOutlet UILabel *addr1label;

@property (weak, nonatomic) IBOutlet UILabel *addr2label;

@property (weak, nonatomic) IBOutlet UILabel *citylabel;

@property (weak, nonatomic) IBOutlet UILabel *statelabel;

@property (weak, nonatomic) IBOutlet UILabel *ziplabel;
@end
