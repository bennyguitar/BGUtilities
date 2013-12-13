//
//  BGSystemUtilities.h
//  BGUtilities
//
//  Created by Ben Gordon on 12/13/13.
//  Copyright (c) 2013 Ben Gordon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BGSystemUtilities : NSObject

#pragma mark - Screen Width/Height
/**
 Returns the screen width for the current orientation.
 @returns float
 */
+ (float)screenWidth;

/**
 Returns the screen height for the current orientation.
 @returns float
 */
+ (float)screenHeight;

@end
