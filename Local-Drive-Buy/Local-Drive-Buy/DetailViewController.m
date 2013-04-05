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
    self.descriptionlabel.attributedText = self.detailItem.description;
    self.addr1label.text = self.detailItem.address1;
    self.addr2label.text = self.detailItem.address2;
    self.citylabel.text = self.detailItem.city;
    self.statelabel.text = self.detailItem.state;
    self.ziplabel.text = self.detailItem.zip;
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
