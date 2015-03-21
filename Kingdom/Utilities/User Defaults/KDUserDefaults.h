//
//  KDUserDefaults.h
//  Kingdom
//
//  Created by Bharath G M on 3/17/15.
//  Copyright (c) 2015 Bharath G M. All rights reserved.
//
//

#import <Foundation/Foundation.h>

@interface KDUserDefaults : NSObject
+(void)setUserEmail:(NSString*)inString;
+(NSString*)userEmail;
+(void)setLoggedInStatus:(BOOL)inValue;

+(BOOL)isUserLoggedIn;

+(void)setUserName:(NSString*)inString;;
+(NSString*)userName;
@end
