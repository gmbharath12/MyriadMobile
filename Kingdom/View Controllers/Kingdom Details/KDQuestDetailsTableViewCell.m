//
//  KDQuestDetailsTableViewCell.m
//  Kingdom
//
//  Created by Bharath G M on 3/17/15.
//  Copyright (c) 2015 Bharath G M. All rights reserved.
//
//

#import "KDQuestDetailsTableViewCell.h"

@implementation KDQuestDetailsTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setValuesForDict:(NSDictionary*)inDict;
{
    NSDictionary *giverDict =  inDict[@"giver"];
    self.questName.text = inDict[@"name"];
    self.questGiverNameLabel.text = giverDict[@"name"];
    self.questDescriptionLabel.text = inDict[@"description"];
    self.questGiverImage.imageURL =[NSURL URLWithString: giverDict[@"image"]];
}
@end
