//
//  SSTileGroup.m
//  SudokuSolver
//
//  Created by Kenny Skaggs on 2/24/16.
//  Copyright © 2016 Solstice Mobile. All rights reserved.
//

#import "SSTileGroup.h"

@interface SSTileGroup ()

@property (nonatomic, strong) NSMutableArray *tiles;

@end

@implementation SSTileGroup

- (NSMutableArray *)tiles {
    if (_tiles == nil) {
        _tiles = [NSMutableArray new];
    }
    return _tiles;
}

- (void)addTile:(SSTileButton *)tileButton {
    [tileButton setAsMemberOfGroup:self];
    [[self tiles] addObject:tileButton];
}

- (void)tileFoundValue:(SSTileButton *)tileWithNewValue {
    for (SSTileButton *tileFromGroup in [self tiles]) {
        if (tileFromGroup != tileWithNewValue) {
            [tileFromGroup eliminatePotentialValue:tileWithNewValue.value];
        }
    }
}

- (void)checkForUniquePotentials {
    for (SSTileButton *tile in self.tiles) {
        for (NSNumber *potentialValue in [tile.potentialValues copy]) {
            if ([self tile:tile isOnlyTileWithPotentialValue:[potentialValue intValue]]) {
                [tile setValue:[potentialValue intValue] userSet:NO];
            }
        }
    }
}

- (BOOL)tile:(SSTileButton *)tile isOnlyTileWithPotentialValue:(int)value {
    BOOL isUnique = YES;
    
    for (SSTileButton *tileInGroup in [self tiles]) {
        if (tile != tileInGroup) { // Don't check the one that is requesting the information
            if ([tileInGroup.potentialValues containsObject:[NSNumber numberWithInt:value]]) {
                isUnique = NO;
                break;
            }
        }
    }
    
    return isUnique;
}

@end
