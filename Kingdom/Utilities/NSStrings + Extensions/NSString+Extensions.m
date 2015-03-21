//
//  NSString+Extensions.m
//  Kingdom
//
//  Created by Bharath G M on 3/17/15.
//  Copyright (c) 2015 Bharath G M. All rights reserved.
//

#import "NSString+Extensions.h"
#import "KDConstants.h"


@implementation NSString (reverse)

- (NSString*) stringByAppendingBaseURL
{
    NSString *baseURL = kServerURL;
    return [baseURL stringByAppendingString:self];
}

- (BOOL) isValidEmail
{
    BOOL stricterFilter = NO; // Discussion http://blog.logichigh.com/2010/09/02/validating-an-e-mail-address/
    NSString *stricterFilterString = @"[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}";
    NSString *laxString = @".+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    BOOL result =    [emailTest evaluateWithObject:self];
    if (!result) {
        //        UIAlertView *alertView =        [[UIAlertView alloc] initWithTitle:@"With IYC" message:@"Please enter valid email address" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        //        [alertView show];
    }
    return result;
}

@end
