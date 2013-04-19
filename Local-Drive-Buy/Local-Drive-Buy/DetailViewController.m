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
    NSData * imagedata = [[NSData alloc] initWithContentsOfURL:self.detailItem.imageaddress];
    UIImage * image = [[UIImage alloc] initWithData:imagedata];
    self.imagedisplay.image = image;
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

@end
