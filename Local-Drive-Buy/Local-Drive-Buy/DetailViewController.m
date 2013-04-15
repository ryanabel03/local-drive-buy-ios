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
    self.descriptionlabel.attributedText = self.detailItem.description;
    self.addresslabel.text = self.detailItem.address;
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
