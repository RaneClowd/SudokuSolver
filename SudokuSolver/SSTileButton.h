//
//  SSTileButton.h
//  SudokuSolver
//
//  Created by Kenny Skaggs on 2/23/16.
//  Copyright © 2016 Solstice Mobile. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SSTileButton;
@protocol SSTileDelegate <NSObject>

- (void)tileFoundValue:(SSTileButton *)tileButton;

@end


@interface SSTileButton : UIButton

@property (nonatomic, weak) id<SSTileDelegate> delegate;

@property (nonatomic, strong) NSMutableArray <SSTileButton *> *neighborTiles;

@property (nonatomic) int value;
- (void)eliminatePotentialValue:(int)value;

@end


