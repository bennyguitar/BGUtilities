//
//  BGSystemUtilities.m
//  BGUtilities
//
//  Created by Ben Gordon on 12/13/13.
//  Copyright (c) 2013 Ben Gordon. All rights reserved.
//

#import "BGSystemUtilities.h"

@implementation BGSystemUtilities

#pragma mark - Screen Width/Height
+ (float)screenWidth {
    return UIDeviceOrientationIsLandscape([[UIDevice currentDevice] orientation]) ? [UIScreen mainScreen].bounds.size.height : [UIScreen mainScreen].bounds.size.width;
}

+ (float)screenHeight {
    return UIDeviceOrientationIsLandscape([[UIDevice currentDevice] orientation]) ? [UIScreen mainScreen].bounds.size.width : [UIScreen mainScreen].bounds.size.height;
}


#pragma mark - System Version
+ (float)iOSVersion {
    return [[[UIDevice currentDevice] systemVersion] floatValue];
}


@end
