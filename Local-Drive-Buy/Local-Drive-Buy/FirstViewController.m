//
//  FirstViewController.m
//  Local-Drive-Buy
//
//  Created by Raymond J. Oesch on 3/22/13.
//  Copyright (c) 2013 GVSU. All rights reserved.
//

#import "FirstViewController.h"
#import "DetailViewController.h"

#define MAPZOOM 25000

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self.searchbar setDelegate:self];
    [self.locmanager setDelegate:self];
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
            if (pow((listing.coordinate.latitude - self.mapview.userLocation.coordinate.latitude), 2) + pow((listing.coordinate.longitude - self.mapview.userLocation.coordinate.longitude), 2) < MAPZOOM)
            {
                [self.mapview addAnnotation:listing];
            }
        }
    }
}

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
    _objects = [[NSMutableArray alloc] init];
    [_objects addObject:[[Listing alloc] init_withdict:@{@"title": @"This",
                         @"description": @"A Listing",
                         @"address": @"1 Campus Drive, Allendale, Michigan, 49401",
                         @"category": @"Goods",
                         @"subcategory": @"Arts & Crafts",
                         @"imageaddress": [[NSURL alloc] initWithString:@"https://si0.twimg.com/profile_images/1653774189/CQL_Logo_Small.jpg"]}]];
    [_objects addObject:[[Listing alloc] init_withdict:@{@"title": @"That",
                         @"description": @"Another Listing",
                         @"address": @"6370 Lake Michigan Dr, Allendale, Michigan, 49401",
                         @"category": @"Edibles",
                         @"subcategory": @"Farmer's Market"}]];
}

-(void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.locmanager startMonitoringSignificantLocationChanges];
    [self displayListings];
}

-(void) viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [self.locmanager stopMonitoringSignificantLocationChanges];
}

-(MKAnnotationView *) mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    if ([annotation isKindOfClass:[Listing class]])
    {
        MKAnnotationView * aview = [mapView dequeueReusableAnnotationViewWithIdentifier:@"annotation"];
        if (!aview)
        {
            aview = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"annotation"];
        }
        Listing * l = annotation;
        aview.annotation = annotation;
        aview.canShowCallout = YES;
        aview.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        if (l.image)
        {
            UIImageView * left = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
            left.image = l.image;
            aview.leftCalloutAccessoryView = left;
        }
        else
        {
            aview.leftCalloutAccessoryView = nil;
        }
        NSLog(@"%@", aview.rightCalloutAccessoryView);
        return aview;
    }
    return nil;
}

-(void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    [self performSegueWithIdentifier:@"showDetail" sender:view.annotation];
}

-(void) locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    [self.mapview setRegion:MKCoordinateRegionMakeWithDistance(self.mapview.userLocation.coordinate, MAPZOOM, MAPZOOM)];
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"])
    {
        Listing * object = sender;
        [[segue destinationViewController] setDetailItem:object];
    }
    else if ([[segue identifier] isEqualToString:@"search"])
    {
        NSArray * objects = sender;
        [[segue destinationViewController] setObjects:[objects mutableCopy]];
    }
}

-(void) filterContentForSearchText:(NSString *)searchText
{
    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"SELF.title contains[cd] %@", searchText];
    self.searchresults = [self.objects filteredArrayUsingPredicate:resultPredicate];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self handleSearch:searchBar];
    NSLog(@"User searched for %@", searchBar.text);
    [searchBar resignFirstResponder];
    [self performSegueWithIdentifier:@"search" sender:self.searchresults];
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
    [self handleSearch:searchBar];
}

- (void)handleSearch:(UISearchBar *)searchBar
{
    [self filterContentForSearchText:searchBar.text];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *) searchBar {
    NSLog(@"User canceled search");
    [searchBar resignFirstResponder];
}

@end
