//
//  SSTileButton.m
//  SudokuSolver
//
//  Created by Kenny Skaggs on 2/23/16.
//  Copyright © 2016 Solstice Mobile. All rights reserved.
//

#import "SSTileButton.h"

@interface SSTileButton ()

@property (nonatomic, strong) NSMutableArray *potentialValues;

@end

@implementation SSTileButton

- (NSMutableArray<SSTileButton *> *)neighborTiles {
    if (_neighborTiles == nil) {
        _neighborTiles = [NSMutableArray new];
    }
    
    return _neighborTiles;
}

- (NSMutableArray *)potentialValues {
    if (_potentialValues == nil) {
        _potentialValues = [[NSMutableArray alloc] initWithObjects:@1, @2, @3, @4, @5, @6, @7, @8, @9, nil];
    }
    return _potentialValues;
}

- (void)setValue:(int)value {
    _value = value;
    [self.delegate tileFoundValue:self];
}

- (void)eliminatePotentialValue:(int)value {
    NSNumber *valueToEliminate = [NSNumber numberWithInt:value];
    NSMutableArray *potentialValues = [self potentialValues];
    if ([potentialValues containsObject:valueToEliminate]) {
        [potentialValues removeObject:valueToEliminate];
        
        if ([potentialValues count] == 1) {
            self.value = value;
        }
    }
}

@end
