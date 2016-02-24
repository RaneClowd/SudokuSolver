//
//  SSTileButton.h
//  SudokuSolver
//
//  Created by Kenny Skaggs on 2/23/16.
//  Copyright © 2016 Solstice Mobile. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SSTileGroup;
@interface SSTileButton : UIButton

- (void)setAsMemberOfGroup:(SSTileGroup *)tileGroup;

@property (nonatomic, readonly) int value;
- (void)setValue:(int)value userSet:(BOOL)userSet;

- (void)eliminatePotentialValue:(int)value;

- (NSMutableArray *)potentialValues;

@end


