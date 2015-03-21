//
//  KDKingdomDetailsViewController.h
//  Kingdom
//
//  Created by Bharath G M on 3/17/15.
//  Copyright (c) 2015 Bharath G M. All rights reserved.
//
//


#import <UIKit/UIKit.h>
#import "AsyncImageView.h"

@interface KDKingdomDetailsViewController : UIViewController
@property (strong, nonatomic) IBOutlet AsyncImageView *kingdomImageView;
@property (strong, nonatomic) NSMutableArray *dataSourceArray;
@property (strong, nonatomic) IBOutlet UILabel *populationLabel;
@property (strong, nonatomic) IBOutlet UILabel *climateLabel;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,assign)NSDictionary *selectedDict;
@end
