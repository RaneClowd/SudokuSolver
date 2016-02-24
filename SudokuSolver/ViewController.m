//
//  ViewController.m
//  SudokuSolver
//
//  Created by Kenny Skaggs on 2/23/16.
//  Copyright © 2016 Solstice Mobile. All rights reserved.
//

#import "ViewController.h"

#import "SSTileButton.h"
#import "SSTileGroup.h"

#import "SSValuePicker.h"

@interface ViewController ()

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

@property (strong, nonatomic) NSMutableArray *tileGroups;

@end

@implementation ViewController

#pragma mark - Setup

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureTiles];
    [self linkTileCollections];
}

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
    [tile setValue:0 userSet:YES];
    [tile addTarget:self action:@selector(tileTapped:) forControlEvents:UIControlEventTouchUpInside];
    [tile setBackgroundColor:[UIColor lightGrayColor]];
}

#pragma mark - Tile Linking

- (NSMutableArray *)tileGroups {
    if (_tileGroups == nil) {
        _tileGroups = [NSMutableArray new];
    }
    return _tileGroups;
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
    SSTileGroup *newTileGroup = [SSTileGroup new];
    [[self tileGroups] addObject:newTileGroup];
    
    for (SSTileButton *tile in tileCollection) {
        [newTileGroup addTile:tile];
    }
}

- (void)tileTapped:(SSTileButton *)tile {
    SSValuePicker *valuePicker = [SSValuePicker new];
    [valuePicker setTranslatesAutoresizingMaskIntoConstraints:NO];
    valuePicker.tile = tile;
    
    [self.view addSubview:valuePicker];
    
    NSLayoutConstraint *centerXConstraint = [NSLayoutConstraint constraintWithItem:valuePicker
                                                                         attribute:NSLayoutAttributeCenterX
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:tile
                                                                         attribute:NSLayoutAttributeCenterX
                                                                        multiplier:1
                                                                          constant:0];
    centerXConstraint.priority = UILayoutPriorityDefaultLow;
    NSLayoutConstraint *centerYConstraint = [NSLayoutConstraint constraintWithItem:valuePicker
                                                                         attribute:NSLayoutAttributeCenterY
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:tile
                                                                         attribute:NSLayoutAttributeCenterY
                                                                        multiplier:1
                                                                          constant:0];
    centerYConstraint.priority = UILayoutPriorityDefaultLow;
    [self.view addConstraint:centerXConstraint];
    [self.view addConstraint:centerYConstraint];
    
    NSLayoutConstraint *topBorderConstraint = [NSLayoutConstraint constraintWithItem:valuePicker
                                                                           attribute:NSLayoutAttributeTop
                                                                           relatedBy:NSLayoutRelationGreaterThanOrEqual
                                                                              toItem:self.view
                                                                           attribute:NSLayoutAttributeTop
                                                                          multiplier:1
                                                                            constant:0];
    topBorderConstraint.priority = UILayoutPriorityDefaultHigh;
    NSLayoutConstraint *bottomBorderConstraint = [NSLayoutConstraint constraintWithItem:valuePicker
                                                                              attribute:NSLayoutAttributeBottom
                                                                              relatedBy:NSLayoutRelationLessThanOrEqual
                                                                                 toItem:self.view
                                                                              attribute:NSLayoutAttributeBottom
                                                                             multiplier:1
                                                                               constant:0];
    bottomBorderConstraint.priority = UILayoutPriorityDefaultHigh;
    NSLayoutConstraint *rightBorderConstraint = [NSLayoutConstraint constraintWithItem:valuePicker
                                                                             attribute:NSLayoutAttributeTrailing
                                                                             relatedBy:NSLayoutRelationLessThanOrEqual
                                                                                toItem:self.view
                                                                             attribute:NSLayoutAttributeTrailing
                                                                            multiplier:1
                                                                              constant:0];
    rightBorderConstraint.priority = UILayoutPriorityDefaultHigh;
    NSLayoutConstraint *leftBorderConstraint = [NSLayoutConstraint constraintWithItem:valuePicker
                                                                            attribute:NSLayoutAttributeLeading
                                                                            relatedBy:NSLayoutRelationGreaterThanOrEqual
                                                                               toItem:self.view
                                                                            attribute:NSLayoutAttributeLeading
                                                                           multiplier:1
                                                                             constant:0];
    leftBorderConstraint.priority = UILayoutPriorityDefaultHigh;
    [self.view addConstraint:topBorderConstraint];
    [self.view addConstraint:bottomBorderConstraint];
    [self.view addConstraint:leftBorderConstraint];
    [self.view addConstraint:rightBorderConstraint];
}

@end
