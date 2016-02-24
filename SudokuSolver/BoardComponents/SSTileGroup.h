//
//  SSTileGroup.h
//  SudokuSolver
//
//  Created by Kenny Skaggs on 2/24/16.
//  Copyright © 2016 Solstice Mobile. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSTileButton.h"

@interface SSTileGroup : NSObject

- (void)addTile:(SSTileButton *)tileButton;

- (void)tileFoundValue:(SSTileButton *)tileButton;

- (void)checkForUniquePotentials;

@end
