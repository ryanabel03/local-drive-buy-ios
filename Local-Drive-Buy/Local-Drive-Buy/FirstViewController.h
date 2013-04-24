//
//  FirstViewController.h
//  Local-Drive-Buy
//
//  Created by Raymond J. Oesch on 3/22/13.
//  Copyright (c) 2013 GVSU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <RestKit/RestKit.h>
#import "DetailViewController.h"
#import "AppDelegate.h"
#import "UserAnnotation.h"

@interface FirstViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate, UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapview;

@property (strong, nonatomic) CLLocationManager * locmanager;

@property (strong, nonatomic) MKAnnotationView *annotationview;

@property (strong, nonatomic) NSArray * objects;

@property (strong, nonatomic) NSArray * searchresults;

@property (weak, nonatomic) IBOutlet UISearchBar *searchbar;

@property (strong, nonatomic) NSMutableDictionary * users;

@end
