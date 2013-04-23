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

@property (weak, nonatomic) IBOutlet UILabel *namelabel;

@property (weak, nonatomic) IBOutlet UILabel *addr1label;

@property (weak, nonatomic) IBOutlet UILabel *addr2label;

@property (weak, nonatomic) IBOutlet UILabel *citylabel;

@property (weak, nonatomic) IBOutlet UILabel *statelabel;

@property (weak, nonatomic) IBOutlet UILabel *ziplabel;

@property (weak, nonatomic) IBOutlet UILabel *emaillabel;

@property (weak, nonatomic) IBOutlet UILabel *phonelabel;

@property (weak, nonatomic) IBOutlet UILabel *categorylabel;

@property (weak, nonatomic) IBOutlet UILabel *sublabel;

@property (weak, nonatomic) IBOutlet UIImageView *imagedisplay;

@property (weak, nonatomic) IBOutlet UIButton *favoritesbutton;

- (IBAction)favs:(id)sender;

- (BOOL) isinfavorites;

@end
