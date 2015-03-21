//
//  KDKingdomTableViewCell.m
//  Kingdom
//
//  Created by Bharath G M on 3/17/15.
//  Copyright (c) 2015 Bharath G M. All rights reserved.
//
//

#import "KDKingdomTableViewCell.h"

@implementation KDKingdomTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setValuesForDict:(NSDictionary*)inDict;
{
    self.kingdomImageView.imageURL = [NSURL URLWithString:inDict[@"image"]];
    self.kingdomLabel.text = inDict[@"name"];
    
}
@end
