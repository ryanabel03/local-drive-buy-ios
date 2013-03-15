//
//  DataViewController.h
//  Local-Drive-Buy
//
//  Created by Raymond J. Oesch on 3/15/13.
//  Copyright (c) 2013 GVSU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DataViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *dataLabel;
@property (strong, nonatomic) id dataObject;

@end
