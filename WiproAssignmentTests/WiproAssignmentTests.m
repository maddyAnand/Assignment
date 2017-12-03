//
//  WiproAssignmentTests.m
//  WiproAssignmentTests
//
//  Created by anand madhav on 29/11/17.
//  Copyright © 2017 anand madhav. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ViewController.h"

@interface WiproAssignmentTests : XCTestCase
@property XCTestExpectation *expectation;
@property(nonatomic,strong) ViewController *vcTest;

@end

@implementation WiproAssignmentTests

- (void)setUp {
    [super setUp];
    _vcTest = [[ViewController alloc]init];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}
-(void)testAssynchronusTaskTwo{
    [self.vcTest maintask];
    NSString *expectedString =@"About Canada";
    NSString *resultString = self.vcTest.titleString;
    XCTAssertEqualObjects(expectedString, resultString);
    
}
-(void)testAssynchronusTask{
    _expectation = [self expectationWithDescription:@"test for city..."];
    [_expectation fulfill];
    [self.vcTest maintask];
    [self.vcTest fetchServerData];
    
    [self waitForExpectationsWithTimeout:5.0 handler:^(NSError * _Nullable error) {
        NSString *expectedString =@"About Canada";
        NSString *resultString = self.vcTest.titleString;
        XCTAssertEqualObjects(expectedString, resultString);
    }];
    
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
