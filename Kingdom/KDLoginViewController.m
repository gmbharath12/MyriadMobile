//
//  ViewController.m
//  Kingdom
//
//  Created by Bharath G M on 3/17/15.
//  Copyright (c) 2015 Bharath G M. All rights reserved.
//
//

#import "KDLoginViewController.h"
#import "AFHTTPRequestOperationManager.h"
#import "KDConstants.h"
#import "NSString+Extensions.h"
#import "KDKingdomListViewController.h"
#import "AppDelegate.h"
#import "KDUserDefaults.h"


@interface KDLoginViewController ()

@end

@implementation KDLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    if ([KDUserDefaults isUserLoggedIn]) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        KDKingdomListViewController *viewCtrl = (KDKingdomListViewController *)[storyboard instantiateViewControllerWithIdentifier:@"KDKingdomListViewController"];
        [self.navigationController pushViewController:viewCtrl animated:NO];
    }
    self.emailField.text = [KDUserDefaults userEmail];
    self.nameField.text = [KDUserDefaults userName];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = YES;

}
- (IBAction)submitButtonClicked:(id)sender
{
    
    [self.emailField resignFirstResponder];
    [self.nameField resignFirstResponder];
    
    if (! [self.emailField.text isValidEmail])
    {
        [[[UIAlertView alloc] initWithTitle:kAppName message:@"Enter Valid email" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil] show];
        return;
    }
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:self.emailField.text forKey:@"email"];
    [params setValue:self.nameField.text forKey:@"name"];
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *requestURLString = [kSubscribeAPI stringByAppendingBaseURL];
    
    [manager POST:requestURLString parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        NSRange range = [responseObject[kStatus] rangeOfString:kSuccessMessage];
        if (range.length){
            [[[UIAlertView alloc] initWithTitle:kAppName message:responseObject[kStatus] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil] show];
            [KDUserDefaults setUserEmail:self.emailField.text];
            [KDUserDefaults setUserName:self.nameField.text];
            
            [KDUserDefaults setLoggedInStatus:YES];
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            KDKingdomListViewController *viewCtrl = (KDKingdomListViewController *)[storyboard instantiateViewControllerWithIdentifier:@"KDKingdomListViewController"];
            [self.navigationController pushViewController:viewCtrl animated:YES];
            
        }
        [[AppDelegate sharedAppDelegate] stopAnimating];
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        [[AppDelegate sharedAppDelegate] stopAnimating];
        
    }];
    
    
}


#pragma mark--

#pragma mark UITextField Delegates


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
