//
//  ViewController.m
//  SudokuSolver
//
//  Created by Kenny Skaggs on 2/23/16.
//  Copyright © 2016 Solstice Mobile. All rights reserved.
//

#import "ViewController.h"
#import "SSTileButton.h"

@interface ViewController () <SSTileDelegate>

@property (strong, nonatomic) IBOutletCollection(SSTileButton) NSArray *centerGroupCollection;
@property (strong, nonatomic) IBOutletCollection(SSTileButton) NSArray *leftGroupCollection;
@property (strong, nonatomic) IBOutletCollection(SSTileButton) NSArray *rightGroupCollection;
@property (strong, nonatomic) IBOutletCollection(SSTileButton) NSArray *topGroupCollection;
@property (strong, nonatomic) IBOutletCollection(SSTileButton) NSArray *topRightGroupCollection;
@property (strong, nonatomic) IBOutletCollection(SSTileButton) NSArray *topLeftGroupCollection;
@property (strong, nonatomic) IBOutletCollection(SSTileButton) NSArray *bottomGroupCollection;
@property (strong, nonatomic) IBOutletCollection(SSTileButton) NSArray *bottomLeftGroupCollection;
@property (strong, nonatomic) IBOutletCollection(SSTileButton) NSArray *bottomRightGroupCollection;

@property (strong, nonatomic) IBOutletCollection(SSTileButton) NSArray *rowOne;
@property (strong, nonatomic) IBOutletCollection(SSTileButton) NSArray *rowTwo;
@property (strong, nonatomic) IBOutletCollection(SSTileButton) NSArray *rowThree;
@property (strong, nonatomic) IBOutletCollection(SSTileButton) NSArray *rowFour;
@property (strong, nonatomic) IBOutletCollection(SSTileButton) NSArray *rowFive;
@property (strong, nonatomic) IBOutletCollection(SSTileButton) NSArray *rowSix;
@property (strong, nonatomic) IBOutletCollection(SSTileButton) NSArray *rowSeven;
@property (strong, nonatomic) IBOutletCollection(SSTileButton) NSArray *rowEight;
@property (strong, nonatomic) IBOutletCollection(SSTileButton) NSArray *rowNine;

@property (strong, nonatomic) IBOutletCollection(SSTileButton) NSArray *columnOne;
@property (strong, nonatomic) IBOutletCollection(SSTileButton) NSArray *columnTwo;
@property (strong, nonatomic) IBOutletCollection(SSTileButton) NSArray *columnThree;
@property (strong, nonatomic) IBOutletCollection(SSTileButton) NSArray *columnFour;
@property (strong, nonatomic) IBOutletCollection(SSTileButton) NSArray *columnFive;
@property (strong, nonatomic) IBOutletCollection(SSTileButton) NSArray *columnSix;
@property (strong, nonatomic) IBOutletCollection(SSTileButton) NSArray *columnSeven;
@property (strong, nonatomic) IBOutletCollection(SSTileButton) NSArray *columnEight;
@property (strong, nonatomic) IBOutletCollection(SSTileButton) NSArray *columnNine;

@end

@implementation ViewController

#pragma mark - Setup
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureTiles];
    [self linkTileCollections];
}

#pragma mark Tile Linking

- (void)configureTiles {
    for (SSTileButton *tile in self.rowOne) {
        [self configureTile:tile];
    }
    for (SSTileButton *tile in self.rowTwo) {
        [self configureTile:tile];
    }
    for (SSTileButton *tile in self.rowThree) {
        [self configureTile:tile];
    }
    for (SSTileButton *tile in self.rowFour) {
        [self configureTile:tile];
    }
    for (SSTileButton *tile in self.rowFive) {
        [self configureTile:tile];
    }
    for (SSTileButton *tile in self.rowSix) {
        [self configureTile:tile];
    }
    for (SSTileButton *tile in self.rowSeven) {
        [self configureTile:tile];
    }
    for (SSTileButton *tile in self.rowEight) {
        [self configureTile:tile];
    }
    for (SSTileButton *tile in self.rowNine) {
        [self configureTile:tile];
    }
}

- (void)configureTile:(SSTileButton *)tile {
    [tile setDelegate:self];
    [tile setValue:0];
}

- (void)linkTileCollections {
    [self linkTilesInCollection:self.centerGroupCollection];
    [self linkTilesInCollection:self.topGroupCollection];
    [self linkTilesInCollection:self.topLeftGroupCollection];
    [self linkTilesInCollection:self.topRightGroupCollection];
    [self linkTilesInCollection:self.bottomGroupCollection];
    [self linkTilesInCollection:self.bottomRightGroupCollection];
    [self linkTilesInCollection:self.bottomLeftGroupCollection];
    [self linkTilesInCollection:self.leftGroupCollection];
    [self linkTilesInCollection:self.rightGroupCollection];
    
    [self linkTilesInCollection:self.rowOne];
    [self linkTilesInCollection:self.rowTwo];
    [self linkTilesInCollection:self.rowThree];
    [self linkTilesInCollection:self.rowFour];
    [self linkTilesInCollection:self.rowFive];
    [self linkTilesInCollection:self.rowSix];
    [self linkTilesInCollection:self.rowSeven];
    [self linkTilesInCollection:self.rowEight];
    [self linkTilesInCollection:self.rowNine];
    
    [self linkTilesInCollection:self.columnOne];
    [self linkTilesInCollection:self.columnTwo];
    [self linkTilesInCollection:self.columnThree];
    [self linkTilesInCollection:self.columnFour];
    [self linkTilesInCollection:self.columnFive];
    [self linkTilesInCollection:self.columnSix];
    [self linkTilesInCollection:self.columnSeven];
    [self linkTilesInCollection:self.columnEight];
    [self linkTilesInCollection:self.columnNine];
}

- (void)linkTilesInCollection:(NSArray *)tileCollection {
    for (SSTileButton *tile in tileCollection) {
        for (SSTileButton *tileToLink in tileCollection) {
            if (tile != tileToLink) { // Don't link tiles to themselves
                [[tile neighborTiles] addObject:tileToLink];
            }
        }
    }
}

#pragma mark Solving

- (void)tileFoundValue:(SSTileButton *)tileButton {
    for (SSTileButton *linkedTile in tileButton.neighborTiles) {
        [linkedTile eliminatePotentialValue:tileButton.value];
    }
}

@end
