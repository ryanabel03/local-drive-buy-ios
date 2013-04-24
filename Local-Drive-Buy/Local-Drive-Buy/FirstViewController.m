//
//  FirstViewController.m
//  Local-Drive-Buy
//
//  Created by Raymond J. Oesch on 3/22/13.
//  Copyright (c) 2013 GVSU. All rights reserved.
//

#import "FirstViewController.h"
#import "AppDelegate.h"

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
    [self.mapview userTrackingMode];NSURL * baseurl = [NSURL URLWithString:[WEBAPPPATH stringByAppendingString:@"/"]];
    AFHTTPClient * client = [AFHTTPClient clientWithBaseURL:baseurl];
    [client setDefaultHeader:@"Accept" value:RKMIMETypeJSON];
    RKObjectManager * objectmanager = [[RKObjectManager alloc] initWithHTTPClient:client];
    RKObjectMapping * listingmapping = [RKObjectMapping mappingForClass:[Listing class]];
    [listingmapping addAttributeMappingsFromDictionary:@{
     @"title": @"title",
     @"description": @"description",
     @"category": @"category",
     @"sub_category": @"subcategory"
     }];
    RKObjectMapping * usermapping = [RKObjectMapping mappingForClass:[User class]];
    [usermapping addAttributeMappingsFromDictionary:@{
     @"address_one": @"addr1",
     @"address_two": @"addr2",
     @"business_name": @"name",
     @"city": @"city",
     @"state": @"state",
     @"zip": @"zip",
     @"email": @"email",
     @"phone": @"phone",
     @"pic_url": @"imageaddress"
     }];
    [listingmapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"user_info" toKeyPath:@"user" withMapping:usermapping]];
    RKResponseDescriptor * responsedescriptor = [RKResponseDescriptor responseDescriptorWithMapping:listingmapping pathPattern:nil keyPath:nil statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    [objectmanager addResponseDescriptor:responsedescriptor];
    [objectmanager getObjectsAtPath:[WEBAPPPATH stringByAppendingString:@"/api/listings"] parameters:@{} success:^(RKObjectRequestOperation * operation, RKMappingResult * mappingresult)
     {
         NSArray * result = [mappingresult array];
         self.objects = [result mutableCopy];
         [self displayListings];
         self.listingsloaded = TRUE;
     }
                            failure:^(RKObjectRequestOperation * operation, NSError * error)
     {
         NSLog(@"failure: operation: %@ \n\nerror: %@", operation, error);
     }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)displayListings
{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    id ul = [self.mapview userLocation];
    NSMutableArray * pins = [[NSMutableArray alloc] initWithArray:[self.mapview annotations]];
    if (ul)
    {
        [pins removeObject:ul];
    }
    [self.mapview removeAnnotations:pins];
    
    for (NSString * key in self.users)
    {
        UserAnnotation * ua = self.users[key];
            if ([ua.location distanceFromLocation:self.locmanager.location] < MAPZOOM)
            {
                if (ua.hasedible && appDelegate.checkedible){
                    dispatch_async(dispatch_get_main_queue(), ^
                    {
                        [self.mapview addAnnotation:ua];
                    });
                }
                else if (ua.hasgoods && appDelegate.checkgoods){
                    dispatch_async(dispatch_get_main_queue(), ^
                    {
                        [self.mapview addAnnotation:ua];
                    });
                }
                else if (ua.hasbrewery && appDelegate.checkbrewery){
                    dispatch_async(dispatch_get_main_queue(), ^
                    {
                        [self.mapview addAnnotation:ua];
                    });
                }
                else if (ua.hasfarmersmarket && appDelegate.checkfarmersmarket){
                    dispatch_async(dispatch_get_main_queue(), ^
                    {
                        [self.mapview addAnnotation:ua];
                    });
                }
                else if (ua.hasrestaurant && appDelegate.checkrestaurant){
                    dispatch_async(dispatch_get_main_queue(), ^
                    {
                        [self.mapview addAnnotation:ua];
                    });
                }
                else if (ua.hasroadsidestand && appDelegate.checkroadsidestand){
                    dispatch_async(dispatch_get_main_queue(), ^
                                   {
                                       [self.mapview addAnnotation:ua];
                                   });
                }
                else if (ua.hasupickorchard && appDelegate.checkupickorchard){
                    dispatch_async(dispatch_get_main_queue(), ^
                                   {
                                       [self.mapview addAnnotation:ua];
                                   });
                }
                else if (ua.hasarsandcrafts && appDelegate.checkarsandcrafts){
                    dispatch_async(dispatch_get_main_queue(), ^
                                   {
                                       [self.mapview addAnnotation:ua];
                                   });
                }
                else if (ua.hasclothing && appDelegate.checkclothing){
                    dispatch_async(dispatch_get_main_queue(), ^
                                   {
                                       [self.mapview addAnnotation:ua];
                                   });
                }
                else if (ua.hashealthandfitness && appDelegate.checkhealthandfitness){
                    dispatch_async(dispatch_get_main_queue(), ^
                                   {
                                       [self.mapview addAnnotation:ua];
                                   });
                }
                else if (ua.hasfurniture && appDelegate.checkfurniture){
                    dispatch_async(dispatch_get_main_queue(), ^
                                   {
                                       [self.mapview addAnnotation:ua];
                                   });
                }
                else if (ua.hasother && appDelegate.checkother){
                    dispatch_async(dispatch_get_main_queue(), ^
                                   {
                                       [self.mapview addAnnotation:ua];
                                   });
                }
           }
    }
}

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
    AppDelegate * appdelegate = [[UIApplication sharedApplication] delegate];
    appdelegate.slideoutController.contentController.navigationBarHidden = NO;
}

-(void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.locmanager startMonitoringSignificantLocationChanges];
    if (self.listingsloaded)
    {
        [self displayListings];
    }
}

-(void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    AppDelegate * appdelegate = [[UIApplication sharedApplication] delegate];
    appdelegate.slideoutController.contentController.navigationBarHidden = YES;
}

-(void) viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [self.locmanager stopMonitoringSignificantLocationChanges];
}

-(MKAnnotationView *) mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    if ([annotation isKindOfClass:[UserAnnotation class]])
    {
        MKAnnotationView * aview = [mapView dequeueReusableAnnotationViewWithIdentifier:@"annotation"];
        if (!aview)
        {
            aview = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"annotation"];
        }
        UserAnnotation * u = annotation;
        aview.annotation = annotation;
        aview.canShowCallout = YES;
        aview.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        if (u.image)
        {
            UIImageView * left = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
            left.contentMode = UIViewContentModeScaleAspectFit;
            left.image = u.image;
            aview.leftCalloutAccessoryView = left;
        }
        else
        {
            aview.leftCalloutAccessoryView = nil;
        }
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
        UserAnnotation * object = sender;
        [[segue destinationViewController] setTitle:object.title];
        [[segue destinationViewController] setObjects:[object.listings mutableCopy]];
    }
    else if ([[segue identifier] isEqualToString:@"search"])
    {
        NSArray * objects = sender;
        [[segue destinationViewController] setObjects:[objects mutableCopy]];
    }
}

-(void) filterContentForSearchText:(NSString *)searchText
{
    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"ANY {SELF.title, SELF.description, SELF.user.name, SELF.category, SELF.subcategory} contains[cd] %@", searchText];
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

- (NSMutableDictionary *) users
{
    if (!_users)
    {
        _users = [[NSMutableDictionary alloc] init];for (Listing * listing in self.objects)
        {
            if(![_users objectForKey:listing.user.name])
            {
                [_users setObject:[[UserAnnotation alloc] init_withlisting:listing] forKey:listing.user.name];
            }
            else
            {
                [_users[listing.user.name] addlisting:listing];
                NSLog(@"%@", listing.description);
            }
        }
    }
    
    
    return _users;
}

@end
