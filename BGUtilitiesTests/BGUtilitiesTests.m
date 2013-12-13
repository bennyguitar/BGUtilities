//
//  BGUtilitiesTests.m
//  BGUtilitiesTests
//
//  Created by Ben Gordon on 12/11/13.
//  Copyright (c) 2013 Ben Gordon. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "UIView+BGViewUtilities.h"
#import "NSString+BGStringUtilities.h"

@interface BGUtilitiesTests : XCTestCase

@end

@implementation BGUtilitiesTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

#pragma mark - UIView methods
- (void)testFadeIn {
    // Create View
    UIView *newView = [[UIView alloc] init];
    newView.alpha = 0;
    
    // Test
    [newView fadeInWithDuration:0.0 completion:^(BOOL finished){
        XCTAssertEqual(newView.alpha, 1, @"%s Failed", __PRETTY_FUNCTION__);
    }];
}

- (void)testFadeOut {
    // Create View
    UIView *newView = [[UIView alloc] init];
    newView.alpha = 1;
    
    // Test
    [newView fadeOutWithCompletion:^(BOOL finished){
        XCTAssertEqual(newView.alpha, 0, @"%s Failed", __PRETTY_FUNCTION__);
    }];
}


#pragma mark - NSString methods
- (void)testValidEmailRegex {
    NSString *email = @"benjamin.gordon@intermarkgroup.com";
    XCTAssert([email isValidEmail], @"%s Failed", __PRETTY_FUNCTION__);
}

- (void)testInvalidEmailRegex {
    NSString *email = @"benjamin.gordon@intermarkgroup.comsdfs;";
    XCTAssertFalse([email isValidEmail], @"%s Failed", __PRETTY_FUNCTION__);
}

- (void)testStringContainsIsValid {
    XCTAssert([@"Contains" contains:@"on"], @"%s Failed", __PRETTY_FUNCTION__);
}

- (void)testStringContainsIsInvalid {
    XCTAssertFalse([@"Contains" contains:@"BG"], @"%s Failed", __PRETTY_FUNCTION__);
}

- (void)testArrayContainsIsValid {
    BOOL contains = [@"Contains" containsAnyInArray:@[@"hi",@"on"]];
    XCTAssert(contains, @"%s Failed", __PRETTY_FUNCTION__);
}

- (void)testArrayContainsIsInvalid {
    BOOL contains = [@"Contains" containsAnyInArray:@[@"BG",@"www"]];
    XCTAssertFalse(contains, @"%s Failed", __PRETTY_FUNCTION__);
}

@end
