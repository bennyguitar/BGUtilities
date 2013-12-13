//
//  UIView+BGViewUtilities.m
//  BGUtilities
//
//  Created by Ben Gordon on 12/12/13.
//  Copyright (c) 2013 Ben Gordon. All rights reserved.
//

#import "UIView+BGViewUtilities.h"

@implementation UIView (BGViewUtilities)

#pragma mark - Separator UIView
+ (UIView *)separatorWithWidth:(float)width origin:(CGPoint)origin color:(UIColor *)color {
    UIView *separator = [[UIView alloc] initWithFrame:CGRectMake(origin.x, origin.y, width, 1)];
    [separator setBackgroundColor:color];
    [separator setAutoresizingMask:UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleWidth];
    return separator;
}


#pragma mark - Shadows
- (void)addShadow {
    [self addShadowWithOffsetSize:CGSizeMake(1.0f, 1.0f) color:[UIColor blackColor] opacity:0.4 radius:0.0];
}

- (void)addShadowWithOffsetSize:(CGSize)offset color:(UIColor *)color opacity:(float)opacity radius:(float)radius {
    self.layer.shadowColor = color ? color.CGColor : [UIColor blackColor].CGColor;
    self.layer.shadowOpacity = opacity ? opacity : 0.5;
    self.layer.shadowOffset = offset.height ? offset : CGSizeMake(1, 1);
    self.layer.shadowRadius = radius ? radius : 0;
    self.layer.masksToBounds = NO;
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:radius];
    self.layer.shadowPath = path.CGPath;
}


#pragma mark - Borders
- (void)addBorderWithWidth:(float)width color:(UIColor *)color {
    self.layer.borderWidth = width ? width : 1.0;
    self.layer.borderColor = color ? color.CGColor : [UIColor blackColor].CGColor;
}


#pragma mark - Corner Radius
- (void)setCornerRadius:(float)radius {
    self.layer.cornerRadius = radius;
}


#pragma mark - CGRect & CGSize
- (CGPoint)origin {
    return self.frame.origin;
}

- (float)width {
    return self.frame.size.width;
}

- (float)height {
    return self.frame.size.height;
}


#pragma mark - Fading Animations
// Main Fade Method
+ (void)fadeViews:(NSArray *)views withDuration:(float)duration fadeIn:(BOOL)fadeIn completion:(void (^)(BOOL finished))completion {
    [UIView animateWithDuration:(duration ? duration : 0.25) animations:^{
        [views enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            [(UIView *)obj setAlpha:(fadeIn ? 1.0 : 0.0)];
        }];
    } completion:^(BOOL finished){
        completion(YES);
    }];
}

// Fade In
- (void)fadeIn {
    [self fadeInWithDuration:0.25 completion:nil];
}

- (void)fadeInWithCompletion:(void (^)(BOOL finished))completion {
    [self fadeInWithDuration:0.25 completion:completion];
}

- (void)fadeInWithDuration:(float)duration {
    [self fadeInWithDuration:duration completion:nil];
}

- (void)fadeInWithDuration:(float)duration completion:(void (^)(BOOL finished))completion {
    [UIView fadeViews:@[self] withDuration:duration fadeIn:YES completion:completion];
}

// Fade Out
- (void)fadeOut {
    [self fadeOutWithDuration:0.25 completion:nil];
}

- (void)fadeOutWithCompletion:(void (^)(BOOL finished))completion {
    [self fadeOutWithDuration:0.25 completion:completion];
}

- (void)fadeOutWithDuration:(float)duration {
    [self fadeOutWithDuration:duration completion:nil];
}

- (void)fadeOutWithDuration:(float)duration completion:(void (^)(BOOL finished))completion {
    [UIView fadeViews:@[self] withDuration:duration fadeIn:NO completion:completion];
}


@end
