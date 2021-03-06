//
//  MasterViewController.m
//  Local-Drive-Buy
//
//  Created by Raymond J. Oesch on 4/1/13.
//  Copyright (c) 2013 GVSU. All rights reserved.
//

#import "MasterViewController.h"

@interface MasterViewController ()
{
    NSArray *_objects;
}

@end

@implementation MasterViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    NSURL * baseurl = [NSURL URLWithString:[WEBAPPPATH stringByAppendingString:@"/"]];
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
         self.allResults = [result mutableCopy];
         if ([self.title isEqualToString:@"Edible"])
         {
             NSPredicate *ediblepredicate = [NSPredicate predicateWithFormat:@"SELF.category LIKE[c] 'Edibles'"];
             _objects = [self.allResults filteredArrayUsingPredicate:ediblepredicate];
         }
         else if ([self.title isEqualToString:@"Goods"])
         {
             NSPredicate *goodspredicate = [NSPredicate predicateWithFormat:@"SELF.category LIKE[c] 'Goods'"];
             _objects = [self.allResults filteredArrayUsingPredicate:goodspredicate];
         }
         else if ([self.title isEqualToString:@"Favorites"])
         {
             NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
             NSMutableArray * favorites = [defaults objectForKey:@"favorites"];
             if (!favorites)
             {
                 favorites = [[NSMutableArray alloc] init];
             }
             NSPredicate *favoritespredicate = [NSPredicate predicateWithFormat:@"SELF.user.name IN %@", favorites];
             _objects = [self.allResults filteredArrayUsingPredicate:favoritespredicate];
             [self.tableView reloadData];
         }
         else
         {
             _objects = self.allResults;
         }
         [self.tableView reloadData];
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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return _objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    Listing * object = _objects[indexPath.row];
    cell.textLabel.text = [object title];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
    {
        Listing *object = _objects[indexPath.row];
        self.detailViewController.detailItem = object;
    }
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"])
    {
        NSIndexPath * indexPath = [self.tableView indexPathForSelectedRow];
        Listing * object = _objects[indexPath.row];
        [[segue destinationViewController] setDetailItem:object];
    }
}

-(void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    if ([self.title isEqualToString:@"Favorites"])
    {
        NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
        NSMutableArray * favorites = [defaults objectForKey:@"favorites"];
        if (!favorites)
        {
            favorites = [[NSMutableArray alloc] init];
        }
        NSPredicate *favoritespredicate = [NSPredicate predicateWithFormat:@"SELF.user.name IN %@", favorites];
        _objects = [self.allResults filteredArrayUsingPredicate:favoritespredicate];
        [self.tableView reloadData];
    }
}

@end
