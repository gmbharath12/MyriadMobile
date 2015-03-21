//
//  KDKingdomListViewController.m
//  Kingdom
//
//  Created by Bharath G M on 3/17/15.
//  Copyright (c) 2015 Bharath G M. All rights reserved.
//
//

#import "KDKingdomListViewController.h"
#import "KDKingdomTableViewCell.h"
#import "AFHTTPRequestOperationManager.h"
#import "KDConstants.h"
#import "NSString+Extensions.h"
#import "KDKingdomDetailsViewController.h"
#import "AppDelegate.h"
#import "KDUserDefaults.h"


@interface KDKingdomListViewController ()

@end

@implementation KDKingdomListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Kingdoms";
self.navigationItem.hidesBackButton = YES;
    self.navigationController.navigationBarHidden = NO;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Logout" style:UIBarButtonItemStylePlain target:self action:@selector(logOut)];

    [self loadData];
}

- (void)logOut
{
    [self.navigationController popViewControllerAnimated:YES];
    [KDUserDefaults setLoggedInStatus:NO];
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


- (void)loadData
{
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *requestURLString = [kKingdomsListAPI stringByAppendingBaseURL];
    
    [manager GET:requestURLString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        self.dataSourceArray = [NSMutableArray arrayWithArray:(NSArray*)responseObject];
        [self.tableView reloadData];
        [[AppDelegate sharedAppDelegate] stopAnimating];

        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        [[AppDelegate sharedAppDelegate] stopAnimating];

    }];

    
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
    return self.dataSourceArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    KDKingdomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"KDKingdomTableViewCell" forIndexPath:indexPath];
    [cell setValuesForDict:_dataSourceArray[indexPath.row]];
    //cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    KDKingdomDetailsViewController *viewCtrl = (KDKingdomDetailsViewController *)[storyboard instantiateViewControllerWithIdentifier:@"KDKingdomDetailsViewController"];
    viewCtrl.selectedDict = self.dataSourceArray[indexPath.row];
    [self.navigationController pushViewController:viewCtrl animated:YES];
    
    
}



@end
