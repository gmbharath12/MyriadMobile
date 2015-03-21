//
//  AppDelegate.m
//  Kingdom
//
//  Created by Bharath G M on 3/17/15.
//  Copyright (c) 2015 Bharath G M. All rights reserved.
//
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"KDActivityView" owner:self options:nil];
    self.activityView = [nib objectAtIndex:0];

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

+(AppDelegate*)sharedAppDelegate
{
    return [UIApplication sharedApplication].delegate;
}


- (void)startAnimating
{
    [self.window addSubview:self.activityView];
    self.activityView.center = self.window.center;
    self.activityView.loadingText.text = @"Loading...";
    self.window.userInteractionEnabled  = NO;
    //    self.activityTimer = [NSTimer scheduledTimerWithTimeInterval:100 target:self selector:@selector(stopAnimating) userInfo:nil repeats:YES];
}

- (void)startAnimatingWithText:(NSString*)inString
{
    [self.window addSubview:self.activityView];
    self.activityView.center = self.window.center;
    self.activityView.loadingText.text = inString;
    self.window.userInteractionEnabled  = NO;
}

- (void)stopAnimating
{
    [self.activityView removeFromSuperview];
    self.window.userInteractionEnabled  = YES;
}




@end
