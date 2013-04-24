//
//  AppDelegate.m
//  Local-Drive-Buy
//
//  Created by Raymond J. Oesch on 3/22/13.
//  Copyright (c) 2013 GVSU. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.checkedible = YES;
    self.checkbrewery = YES;
    self.checkfarmersmarket = YES;
    self.checkrestaurant = YES;
    self.checkroadsidestand = YES;
    self.checkupickorchard = YES;
    self.checkgoods = YES;
    self.checkarsandcrafts = YES;
    self.checkclothing = YES;
    self.checkhealthandfitness = YES;
    self.checkfurniture = YES;
    self.checkother = YES;
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
    
	UIViewController* controller;
    controller = [storyboard instantiateViewControllerWithIdentifier:@"firstScreen"];
    
	self.slideoutController = [AMSlideOutNavigationController slideOutNavigation];
	
	[self.slideoutController addSectionWithTitle:@""];//All
    
    [self.slideoutController addViewControllerToLastSection:controller tagged:1 withTitle:@"Double tap here to filter out" andIcon:@""];
    
    [self.slideoutController addSectionWithTitle:@"Food"];//Edibles
    [self.slideoutController addActionToLastSection:^{
		self.checkedible = !self.checkedible;
	}
											 tagged:3
										  withTitle:@"Edible"
											andIcon:@""];
    
    [self.slideoutController addActionToLastSection:^{
		self.checkbrewery = !self.checkbrewery;
	}
											 tagged:4
										  withTitle:@"Brewery/Winery"
											andIcon:@""];
    
    [self.slideoutController addActionToLastSection:^{
		self.checkfarmersmarket = !self.checkfarmersmarket;
	}
											 tagged:5
										  withTitle:@"Farmer's Market"
											andIcon:@""];
    
    [self.slideoutController addActionToLastSection:^{
		self.checkrestaurant = !self.checkrestaurant;
	}
											 tagged:6
										  withTitle:@"Restaurant"
											andIcon:@""];
    
    [self.slideoutController addActionToLastSection:^{
		self.checkroadsidestand = !self.checkroadsidestand;
	}
											 tagged:7
										  withTitle:@"Roadside Stand"
											andIcon:@""];
    
    [self.slideoutController addActionToLastSection:^{
		self.checkupickorchard = !self.checkupickorchard;
	}
											 tagged:8
										  withTitle:@"U-Pick/Orchard"
											andIcon:@""];
    
    [self.slideoutController addSectionWithTitle:@"Stuff"];//Goods
    
    [self.slideoutController addActionToLastSection:^{
		self.checkgoods = !self.checkgoods;
	}
											 tagged:9
										  withTitle:@"Goods"
											andIcon:@""];
    
    [self.slideoutController addActionToLastSection:^{
		self.checkarsandcrafts = !self.checkarsandcrafts;
	}
											 tagged:10
										  withTitle:@"Arts & Crafts"
											andIcon:@""];
    
    [self.slideoutController addActionToLastSection:^{
		self.checkclothing = !self.checkclothing;
	}
											 tagged:11
										  withTitle:@"Clothing"
											andIcon:@""];
    
    [self.slideoutController addActionToLastSection:^{
		self.checkhealthandfitness = !self.checkhealthandfitness;
	}
											 tagged:11
										  withTitle:@"Health & Fitness"
											andIcon:@""];
    
    [self.slideoutController addActionToLastSection:^{
		self.checkfurniture = !self.checkfurniture;
	}
											 tagged:11
										  withTitle:@"Furniture"
											andIcon:@""];
    
    [self.slideoutController addActionToLastSection:^{
		self.checkother = !self.checkother;
	}
											 tagged:11
										  withTitle:@"Other"
											andIcon:@""];
    
    
    [self.window setRootViewController:self.slideoutController];
    
    // Override point for customization after application launch.
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
