//
//  SSTileButton.m
//  SudokuSolver
//
//  Created by Kenny Skaggs on 2/23/16.
//  Copyright © 2016 Solstice Mobile. All rights reserved.
//

#import "SSTileButton.h"
#import "SSTileGroup.h"

@interface SSTileButton ()

@property (nonatomic, strong) NSMutableArray *potentialValues;
@property (nonatomic, strong) NSPointerArray *tileGroups;

@end

@implementation SSTileButton

- (NSMutableArray *)potentialValues {
    if (_potentialValues == nil) {
        _potentialValues = [[NSMutableArray alloc] initWithObjects:@1, @2, @3, @4, @5, @6, @7, @8, @9, nil];
    }
    return _potentialValues;
}

- (NSPointerArray *)tileGroups {
    if (_tileGroups == nil) {
        _tileGroups = [NSPointerArray weakObjectsPointerArray];
    }
    return _tileGroups;
}

- (void)setAsMemberOfGroup:(SSTileGroup *)tileGroup {
    [[self tileGroups] addPointer:(__bridge void * _Nullable)(tileGroup)];
}

- (void)setValue:(int)value userSet:(BOOL)userSet {
    if (!userSet) {
        for (SSTileGroup *tileGroup in [self tileGroups]) {
            [tileGroup tileFoundValue:self];
        }
    }
    
    self.value = value;
}

- (void)setValue:(int)value {
    _value = value;
    
    NSString *valueText;
    if (value == 0) {
        valueText = @"-";
    } else {
        valueText = [NSString stringWithFormat:@"%d", value];
        [[self potentialValues] removeAllObjects];
    }
    [self setTitle:valueText forState:UIControlStateNormal];
    
}

- (void)eliminatePotentialValue:(int)value {
    NSNumber *valueToEliminate = [NSNumber numberWithInt:value];
    NSMutableArray *potentialValues = [self potentialValues];
    if ([potentialValues containsObject:valueToEliminate]) {
        [potentialValues removeObject:valueToEliminate];
        
        if ([potentialValues count] == 1) {
            self.value = [[potentialValues firstObject] integerValue];
        } else {
            [self searchForUniqueValuesInGroups];
        }
    }
}

- (void)searchForUniqueValuesInGroups {
    for (SSTileGroup *tileGroup in [self tileGroups]) {
        [tileGroup checkForUniquePotentials];
    }
}

@end
