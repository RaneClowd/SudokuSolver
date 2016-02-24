//
//  SSTileGroupTests.m
//  SudokuSolver
//
//  Created by Kenny Skaggs on 2/24/16.
//  Copyright © 2016 Solstice Mobile. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SSTileGroup.h"

@interface SSTileGroupTests : XCTestCase

@end

@implementation SSTileGroupTests

- (void)testTilesOfAGroupSolveEachOther {
    SSTileGroup *group = [SSTileGroup new];
    
    SSTileButton *oneTile = [SSTileButton new];
    SSTileButton *twoTile = [SSTileButton new];
    SSTileButton *threeTile = [SSTileButton new];
    SSTileButton *fourTile = [SSTileButton new];
    SSTileButton *fiveTile = [SSTileButton new];
    SSTileButton *sixTile = [SSTileButton new];
    SSTileButton *sevenTile = [SSTileButton new];
    SSTileButton *eightTile = [SSTileButton new];
    SSTileButton *nineTile = [SSTileButton new];
    
    [fourTile setValue:0 userSet:YES];
    for (SSTileButton *tile in @[oneTile, twoTile, threeTile, fourTile, fiveTile, sixTile, sevenTile, eightTile, nineTile]) {
        [group addTile:tile];
    }
    
    XCTAssert(fourTile.value == 0, @"This test won't work if the tile somehow already knows its value");
    
    [oneTile setValue:1 userSet:NO];
    [eightTile setValue:8 userSet:NO];
    [threeTile setValue:3 userSet:NO];
    [nineTile setValue:9 userSet:NO];
    [sevenTile setValue:7 userSet:NO];
    [twoTile setValue:2 userSet:NO];
    [fiveTile setValue:5 userSet:NO];
    XCTAssert(fourTile.value == 0, @"The tile still shouldn't know if it's a 4 or a 6");
    
    [sixTile setValue:6 userSet:NO];
    
    XCTAssert(fourTile.value == 4, @"All other values in the group are taken, it should know it's a 4");
}

- (void)testCrossGroupSolving {
    
}

@end
