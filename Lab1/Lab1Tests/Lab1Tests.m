//
//  Lab1Tests.m
//  Lab1Tests
//
//  Created by ch484-mac3 on 1/28/15.
//
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

@interface Lab1Tests : XCTestCase

@end

@implementation Lab1Tests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
