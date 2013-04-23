//
//  DetailViewController.m
//  Local-Drive-Buy
//
//  Created by Raymond J. Oesch on 4/1/13.
//  Copyright (c) 2013 GVSU. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void) configureView
{
    // Update the user interface for the detail item.
    self.title = self.detailItem.title;
    self.descriptionlabel.text = self.detailItem.description;
    self.namelabel.text = self.detailItem.user.name;
    self.addr1label.text = self.detailItem.user.addr1;
    self.addr2label.text = self.detailItem.user.addr2;
    self.citylabel.text = self.detailItem.user.city;
    self.statelabel.text = self.detailItem.user.state;
    self.ziplabel.text = self.detailItem.user.zip;
    self.emaillabel.text = self.detailItem.user.email;
    self.phonelabel.text = self.detailItem.user.phone;
    self.categorylabel.text = self.detailItem.category;
    self.sublabel.text = self.detailItem.subcategory;
    self.imagedisplay.contentMode = UIViewContentModeScaleAspectFit;
    self.imagedisplay.image = self.detailItem.user.image;
    if (self.isinfavorites)
    {
        [self.favoritesbutton setTitle:[[@"Remove " stringByAppendingString:self.detailItem.user.name] stringByAppendingString:@" from favorites"] forState:UIControlStateNormal];
    }
    else
    {
        [self.favoritesbutton setTitle:[[@"Add " stringByAppendingString:self.detailItem.user.name] stringByAppendingString:@" to favorites"] forState:UIControlStateNormal];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)favs:(id)sender {
    if ([self isinfavorites])
    {
        NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
        NSMutableArray * favorites = [[defaults objectForKey:@"favorites"] mutableCopy];
        [favorites removeObject:self.detailItem.user.name];
        [defaults setObject:favorites forKey:@"favorites"];
        [defaults synchronize];
        [self.favoritesbutton setTitle:[[@"Add " stringByAppendingString:self.detailItem.user.name] stringByAppendingString:@" to favorites"] forState:UIControlStateNormal];
    }
    else
    {
        NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
        NSMutableArray * favorites = [[defaults objectForKey:@"favorites"] mutableCopy];
        if (!favorites)
        {
            favorites = [[NSMutableArray alloc] init];
        }
        [favorites addObject:self.detailItem.user.name];
        [defaults setObject:favorites forKey:@"favorites"];
        [defaults synchronize];
        [self.favoritesbutton setTitle:[[@"Remove " stringByAppendingString:self.detailItem.user.name] stringByAppendingString:@" from favorites"] forState:UIControlStateNormal];
    }
}

- (BOOL) isinfavorites
{
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    NSArray * favorites = [defaults objectForKey:@"favorites"];
    return [favorites containsObject:self.detailItem.user.name];
}

@end
