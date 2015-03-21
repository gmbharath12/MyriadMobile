//
//  KDKingdomDetailsViewController.m
//  Kingdom
//
//  Created by Bharath G M on 3/17/15.
//  Copyright (c) 2015 Bharath G M. All rights reserved.
//
//

#import "KDKingdomDetailsViewController.h"
#import "AFHTTPRequestOperationManager.h"
#import "KDConstants.h"
#import "NSString+Extensions.h"
#import "KDQuestDetailsTableViewCell.h"
#import "AppDelegate.h"

@interface KDKingdomDetailsViewController ()

@end

@implementation KDKingdomDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadData];

}

- (void)loadData
{
    self.kingdomImageView.imageURL = [NSURL URLWithString:self.selectedDict[@"image"]];
    self.title = self.selectedDict[@"name"];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *detailURL = [NSString stringWithFormat:@"%@%@",kKingdomsDetailsAPI,self.selectedDict[@"id"]];
    NSString *requestURLString = [detailURL stringByAppendingBaseURL];
    
    [manager GET:requestURLString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        NSDictionary *dataDict =(NSDictionary*)responseObject;
        self.populationLabel.text =  [dataDict[@"population"] stringValue];
        self.climateLabel.text = dataDict[@"climate"];
        
        self.dataSourceArray = [NSMutableArray arrayWithArray:(NSArray*)dataDict[@"quests"]];
        [self.tableView reloadData];
        [[AppDelegate sharedAppDelegate] stopAnimating];

        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        [[AppDelegate sharedAppDelegate] stopAnimating];

    }];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.dataSourceArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    KDQuestDetailsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"KDQuestDetailsTableViewCell" forIndexPath:indexPath];
    [cell setValuesForDict:_dataSourceArray[indexPath.row]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}



@end
