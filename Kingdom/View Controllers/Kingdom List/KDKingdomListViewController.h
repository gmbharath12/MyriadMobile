//
//  KDKingdomListViewController.h
//  Kingdom
//
//  Created by Bharath G M on 3/17/15.
//  Copyright (c) 2015 Bharath G M. All rights reserved.
//
//

#import <UIKit/UIKit.h>

@interface KDKingdomListViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *dataSourceArray;
@end
