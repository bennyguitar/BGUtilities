//
//  NSString+BGStringUtilities.h
//  BGUtilities
//
//  Created by Ben Gordon on 12/12/13.
//  Copyright (c) 2013 Ben Gordon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (BGStringUtilities)


#pragma mark - Contains
/**
 A shorthand method that uses NSPredicate to determine if an NSString contains another NSString. This uses a case-insensitive comparison.
 @param searchString    - NSString to check against self
 @returns BOOL
 */
- (BOOL)contains:(NSString *)searchString;

/**
 A shorthand method that uses NSPredicate to determine if an NSString contains any NSString objects inside of an array. This uses a case-insensitive comparison.
 @param searchArray    - NSArray of NSStrings
 @returns BOOL
 */
- (BOOL)containsAnyInArray:(NSArray *)searchArray;


#pragma mark - REGEX
/**
 Takes in a regular expression string to determine whether self evaluates with it or not.
 @param regexString - NSString of the regular expression
 @returns BOOL
 */
- (BOOL)evaluateWithRegex:(NSString *)regexString;


#pragma mark - Email Validation
/**
 Uses regex to determine whether the string is a valid email address or not.
 @returns BOOL
 */
- (BOOL)isValidEmail;


@end
