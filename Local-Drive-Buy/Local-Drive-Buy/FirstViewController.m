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
    [self.mapview setDelegate:self];
    [self.mapview userTrackingMode];
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
        if (CLLocationCoordinate2DIsValid(listing.coordinate))
        {
            [self.mapview addAnnotation:listing];
        }
    }
}

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    _objects = [[NSMutableArray alloc] init];
    [_objects addObject:[[Listing alloc] init_withdict:@{@"title": @"This",
                         @"description": [[NSAttributedString alloc] initWithString:@"A Listing"],
                         @"address": @"1 Campus Drive, Allendale, Michigan, 49401"}]];
    [_objects addObject:[[Listing alloc] init_withdict:@{@"title": @"That",
                         @"description": [[NSAttributedString alloc] initWithString:@"Another Listing"],
                         @"address": @"6370 Lake Michigan Dr, Allendale, Michigan, 49401"}]];
    [self displayListings];
}

-(void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.locmanager startMonitoringSignificantLocationChanges];
    [self.mapview setRegion:MKCoordinateRegionMakeWithDistance(self.mapview.userLocation.coordinate, 25000, 25000)];
}

-(void) viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [self.locmanager stopMonitoringSignificantLocationChanges];
}

-(MKAnnotationView *) mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    MKAnnotationView * aview = [mapView dequeueReusableAnnotationViewWithIdentifier:@"annotation"];
    if (!aview)
    {
        aview = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"annotation"];
    }
    aview.annotation = annotation;
    aview.canShowCallout = YES;
    aview.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    NSLog(@"%@", aview.rightCalloutAccessoryView);
    return aview;
}

-(void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    
}

@end
