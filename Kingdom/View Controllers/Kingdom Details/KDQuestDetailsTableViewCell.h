//
//  KDQuestDetailsTableViewCell.h
//  Kingdom
//
//  Created by Bharath G M on 3/17/15.
//  Copyright (c) 2015 Bharath G M. All rights reserved.
//
//

#import <UIKit/UIKit.h>
#import "AsyncImageView.h"

@interface KDQuestDetailsTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet AsyncImageView *questGiverImage;
@property (strong, nonatomic) IBOutlet UILabel *questGiverNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *questDescriptionLabel;
@property (strong, nonatomic) IBOutlet UILabel *questName;

- (void)setValuesForDict:(NSDictionary*)inDict;
@end
