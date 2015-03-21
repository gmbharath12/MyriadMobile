//
//  AppDelegate.h
//  Kingdom
//
//  Created by Bharath G M on 3/17/15.
//  Copyright (c) 2015 Bharath G M. All rights reserved.
//
//

#import <UIKit/UIKit.h>
#import "KDActivityView.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) KDActivityView *activityView;
+(AppDelegate*)sharedAppDelegate;
- (void)startAnimating;
- (void)startAnimatingWithText:(NSString*)inString;
- (void)stopAnimating;

@end

