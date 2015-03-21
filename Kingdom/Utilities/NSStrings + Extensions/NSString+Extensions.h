//
//  NSString+Extensions.h
//  Kingdom
//
//  Created by Bharath G M on 3/17/15.
//  Copyright (c) 2015 Bharath G M. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSString (reverse)

- (NSString*)stringByAppendingBaseURL;
- (BOOL) isValidEmail;

@end
