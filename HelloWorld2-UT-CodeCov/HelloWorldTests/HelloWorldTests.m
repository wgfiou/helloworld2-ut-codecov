//
//  HelloWorldTests.m
//  HelloWorldTests
//
//  Created by Vesa Vuorio on 12/01/2018.
//  Copyright © 2018 Vesa Vuorio. All rights reserved.
//

#import <XCTest/XCTest.h>
//#import "HelloWorldTests.h"
#import "Calculator.h"

@interface HelloWorldTests : XCTestCase
{
    Calculator *calculator;
    NSString *documentDirPath;
    NSString *fileName;
}

@end

@implementation HelloWorldTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    calculator = [Calculator new];
    documentDirPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    fileName = [documentDirPath stringByAppendingString:@"/HelloWorldTestCoverage.txt"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:fileName]){
        [fileManager createFileAtPath:fileName contents:nil attributes:nil];
        NSString *stepNbr = @"0";
        [stepNbr writeToFile:fileName atomically:YES encoding:NSUTF8StringEncoding error:nil];
    }
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    calculator = nil;
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    //[self measureBlock:^{
    // Put the code you want to measure the time of here.
    //}];
}

- (void) testAddTwoNumbers
{
    NSLog(@"testAddTwoNumbers");
    int result = [calculator addTwoNumbers:3 secondNumber:6];
    XCTAssertEqual(9, result);
}

- (void) testAddTwoDecimals
{
    NSLog(@"testAddTwoDecimals");
    float result = [calculator addTwoDecimals:10.1 plus:1.2];
    XCTAssertEqual(11.3f, result);
}

- (void) testAddTwoNumbersWithCoverage
{
    NSLog(@"testAddTwoDecimalsWithCoverage");
    NSString *fileContents = [NSString stringWithContentsOfFile:fileName encoding:NSUTF8StringEncoding error:NULL];
    int step = [fileContents intValue];
    int result = [calculator addTwoNumbers: step firstNumber:3 secondNumber:6];
    XCTAssertEqual(9, result);
}

@end
