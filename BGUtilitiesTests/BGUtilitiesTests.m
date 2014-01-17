//
//  BGUtilitiesTests.m
//  BGUtilitiesTests
//
//  Created by Ben Gordon on 12/11/13.
//  Copyright (c) 2013 Ben Gordon. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "BGUtilities.h"

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

- (void)testRegexEnumeration {
    __block int result = 0;
    [@"1 2 3 4 5" enumerateRegexMatches:@"\\d+" usingBlock:^(NSString *match, NSInteger index, NSRange matchRange, BOOL *stop) {
        result += [match intValue];
    }];
    
    XCTAssertEqual(result, 15, @"%s Failed.", __PRETTY_FUNCTION__);
}

- (void)testInvalidRegexEnumeration {
    [@"1 2 3 4 5" enumerateRegexMatches:@"\\" usingBlock:^(NSString *match, NSInteger index, NSRange matchRange, BOOL *stop) {
        XCTAssert(NO, @"%s Failed.", __PRETTY_FUNCTION__);
    }];
    
    XCTAssert(YES, @"%s Failed.", __PRETTY_FUNCTION__);
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

- (void)testWordsCount {
    XCTAssertEqualObjects(@([@"This string contains 5 words." numberOfWords]), @(5), @"%s Failed", __PRETTY_FUNCTION__);
}

- (void)testUniqueWordsCount {
    XCTAssertEqualObjects(@([@"This string contains 6 unique words words." uniqueWords].count), @(6), @"%s Failed", __PRETTY_FUNCTION__);
}

- (void)testStopBreaksEnumeration {
    __block int count = 0;
    [@"This string contains 6 unique words." enumerateWordsUsingBlock:^(NSString *word, NSInteger index, BOOL *stop) {
        count++;
        if (count == 3) {
            *stop = YES;
        }
    }];
    
    XCTAssertEqual(count, 3, @"%s Failed.", __PRETTY_FUNCTION__);
}

- (void)testConcatenation {
    NSString *concatenated = [NSString stringByConcatenating:@"Hello ",@"World!", nil];
    XCTAssertEqualObjects(@"Hello World!", concatenated, @"%s Failed", __PRETTY_FUNCTION__);
}


#pragma mark - NSScanner Methods
- (void)testScannerBetweenStrings {
    NSString *testString = @"red green blue yellow purple orange black white";
    NSString *scannedString = @"";
    NSScanner *newScanner = [NSScanner scannerWithString:testString];
    [newScanner scanBetweenString:@"red " andString:@" black" intoString:&scannedString];
    XCTAssertEqualObjects(@"green blue yellow purple orange", scannedString, @"%s Failed.", __PRETTY_FUNCTION__);
}

- (void)testScannerEnumeratesBetweenStrings {
    // Set Up
    NSString *testString = @"red green blue yellow purple orange black white";
    __block NSString *thirdString = @"";
    NSScanner *newScanner = [NSScanner scannerWithString:testString];
    
    // Enumerate
    [newScanner enumerateSubstringsBetweenString:@"red " andString:@" black" separator:@" " block:^(NSString *subString, NSInteger index, BOOL *stop) {
        if (index == 2) {
            thirdString = subString;
            *stop = YES;
        }
    }];
    
    // Test
    XCTAssertEqualObjects(@"yellow", thirdString, @"%s Failed.", __PRETTY_FUNCTION__);
}

@end
