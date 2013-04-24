//
//  AppDelegate.h
//  Local-Drive-Buy
//
//  Created by Raymond J. Oesch on 3/22/13.
//  Copyright (c) 2013 GVSU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AMSlideOutNavigationController.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) AMSlideOutNavigationController*	slideoutController;

@property (strong, nonatomic) NSMutableString *pinSelector;

@property (nonatomic) BOOL checkedible;
@property (nonatomic) BOOL checkbrewery;
@property (nonatomic) BOOL checkfarmersmarket;
@property (nonatomic) BOOL checkrestaurant;
@property (nonatomic) BOOL checkroadsidestand;
@property (nonatomic) BOOL checkupickorchard;
@property (nonatomic) BOOL checkgoods;
@property (nonatomic) BOOL checkarsandcrafts;
@property (nonatomic) BOOL checkclothing;
@property (nonatomic) BOOL checkhealthandfitness;
@property (nonatomic) BOOL checkfurniture;
@property (nonatomic) BOOL checkother;

@end
