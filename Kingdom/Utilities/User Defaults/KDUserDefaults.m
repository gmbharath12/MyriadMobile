//
//  KDUserDefaults.m
//  Kingdom
//
//  Created by Bharath G M on 3/17/15.
//  Copyright (c) 2015 Bharath G M. All rights reserved.
//
//

#import "KDUserDefaults.h"

@implementation KDUserDefaults

+(void)setUserEmail:(NSString*)inString;
{
    [[NSUserDefaults standardUserDefaults] setValue:inString forKey:@"UserEmail"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+(NSString*)userEmail
{
    return [[NSUserDefaults standardUserDefaults] valueForKey:@"UserEmail"];
}

+(void)setUserName:(NSString*)inString;
{
    [[NSUserDefaults standardUserDefaults] setValue:inString forKey:@"UserName"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+(NSString*)userName
{
    return [[NSUserDefaults standardUserDefaults] valueForKey:@"UserName"];
}



+(void)setLoggedInStatus:(BOOL)inValue;
{
    [[NSUserDefaults standardUserDefaults] setValue:[NSNumber numberWithBool:inValue] forKey:@"isLoggedIn"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


+(BOOL)isUserLoggedIn
{
    return [[[NSUserDefaults standardUserDefaults] valueForKey:@"isLoggedIn"] boolValue];

}
@end
