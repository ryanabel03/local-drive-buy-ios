//
//  FirstViewController.m
//  Local-Drive-Buy
//
//  Created by Raymond J. Oesch on 3/22/13.
//  Copyright (c) 2013 GVSU. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _objects = [[NSMutableArray alloc] init];
    [_objects addObject:[[Listing alloc] init_withdict:@{@"title": @"This",
                         @"description": [[NSAttributedString alloc] initWithString:@"A Listing"],
                         @"address1": @"1 Campus Drive",
                         @"city": @"Allendale",
                         @"state": @"Michigan",
                         @"zip": @"49401"}]];
    [_objects addObject:[[Listing alloc] init_withdict:@{@"title": @"That",
                         @"description": [[NSAttributedString alloc] initWithString:@"Another Listing"],
                         @"address1": @"123 Fake St.",
                         @"city": @"Allendale",
                         @"state": @"Michigan",
                         @"zip": @"49401"}]];
    [self displayListings];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)displayListings
{
    for (Listing * listing in _objects)
    {
        MapAnnotation * annotation = [[MapAnnotation alloc] init_withlocation:listing.location];
        //[self.mapview addAnnotation:annotation];
    }
}

-(MKAnnotationView *) mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    return [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"annotation"];
}

@end
