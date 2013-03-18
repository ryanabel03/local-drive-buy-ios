//
//  RootViewController.h
//  Local-Drive-Buy
//
//  Created by Raymond J. Oesch on 3/15/13.
//  Copyright (c) 2013 GVSU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface RootViewController : UIViewController <UIPageViewControllerDelegate, MKMapViewDelegate, CLLocationManagerDelegate>

@property (strong, nonatomic) UIPageViewController *pageViewController;

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) IBOutlet CLLocationManager *locationManager;

@end
