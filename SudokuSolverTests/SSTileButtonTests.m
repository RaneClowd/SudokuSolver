//
//  SSTileButtonTests.m
//  SudokuSolver
//
//  Created by Kenny Skaggs on 2/24/16.
//  Copyright © 2016 Solstice Mobile. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SSTileButton.h"

@interface SSTileButtonTests : XCTestCase

@end

@implementation SSTileButtonTests

- (void)testTileFindsValue {
    SSTileButton *tileButton = [SSTileButton new];
    [tileButton setValue:0 userSet:YES];
    
    [tileButton eliminatePotentialValue:2];
    [tileButton eliminatePotentialValue:9];
    [tileButton eliminatePotentialValue:8];
    XCTAssert(tileButton.value == 0, @"Value should remain unchanged since several values remain as options");
    
    [tileButton eliminatePotentialValue:6];
    [tileButton eliminatePotentialValue:1];
    [tileButton eliminatePotentialValue:3];
    XCTAssert(tileButton.value == 0, @"Value should remain unchanged since a few values remain as options");
    
    [tileButton eliminatePotentialValue:4];
    XCTAssert(tileButton.value == 0, @"Value should remain unchanged since a few values remain as options");
    
    [tileButton eliminatePotentialValue:5];
    
    XCTAssert(tileButton.value == 7, @"Value should be 7 because that is all that remains");
}

@end
