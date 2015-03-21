//
//  KDKingdomTableViewCell.h
//  Kingdom
//
//  Created by Bharath G M on 3/17/15.
//  Copyright (c) 2015 Bharath G M. All rights reserved.
//
//

#import <UIKit/UIKit.h>
#import "AsyncImageView.h"

@interface KDKingdomTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet AsyncImageView *kingdomImageView;
@property (strong, nonatomic) IBOutlet UILabel *kingdomLabel;

- (void)setValuesForDict:(NSDictionary*)inDict;
@end
