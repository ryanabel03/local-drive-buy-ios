//
//  FirstViewController.h
//  Local-Drive-Buy
//
//  Created by Raymond J. Oesch on 3/22/13.
//  Copyright (c) 2013 GVSU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Listing.h"
#import "MapAnnotation.h"

@interface FirstViewController : UIViewController <MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapview;

@property (strong, nonatomic) MKAnnotationView *annotationview;

@property (strong, nonatomic) NSMutableArray * objects;

@end
