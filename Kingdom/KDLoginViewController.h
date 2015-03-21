//
//  ViewController.h
//  Kingdom
//
//  Created by Bharath G M on 3/17/15.
//  Copyright (c) 2015 Bharath G M. All rights reserved.
//
//

#import <UIKit/UIKit.h>

@interface KDLoginViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *nameField;
@property (strong, nonatomic) IBOutlet UITextField *emailField;

- (IBAction)submitButtonClicked:(id)sender;

@end

