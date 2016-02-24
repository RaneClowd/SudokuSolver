//
//  SSValuePicker.m
//  SudokuSolver
//
//  Created by Kenny Skaggs on 2/23/16.
//  Copyright © 2016 Solstice Mobile. All rights reserved.
//

#import "SSValuePicker.h"

const int kNumButtonsPerSide = 3;
const int kButtonWidth = 50;
const int kButtonSpacing = 10;
const int kMaxButtonValue = 9;

@implementation SSValuePicker

- (instancetype)init {
    self = [super init];
    
    [self setSize];
    [self addButtons];
    
    [self setBackgroundColor:[UIColor darkGrayColor]];
    
    return self;
}

- (void)setSize {
    int viewSideSize = (kNumButtonsPerSide * kButtonWidth) + ((kNumButtonsPerSide+1) * kButtonSpacing);
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                     attribute:NSLayoutAttributeHeight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:nil
                                                     attribute:NSLayoutAttributeNotAnAttribute
                                                    multiplier:1
                                                      constant:viewSideSize]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                     attribute:NSLayoutAttributeWidth
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:nil
                                                     attribute:NSLayoutAttributeNotAnAttribute
                                                    multiplier:1
                                                      constant:viewSideSize]];
}

- (void)addButtons {
    UIButton *oneButton = [self createNewButtonWithValue:1];
    UIButton *twoButton = [self createNewButtonWithValue:2];
    UIButton *threeButton = [self createNewButtonWithValue:3];
    UIButton *fourButton = [self createNewButtonWithValue:4];
    UIButton *fiveButton = [self createNewButtonWithValue:5];
    UIButton *sixButton = [self createNewButtonWithValue:6];
    UIButton *sevenButton = [self createNewButtonWithValue:7];
    UIButton *eightButton = [self createNewButtonWithValue:8];
    UIButton *nineButton = [self createNewButtonWithValue:9];
    
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:oneButton
                                                     attribute:NSLayoutAttributeLeading
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeLeading
                                                    multiplier:1
                                                      constant:kButtonSpacing]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:oneButton
                                                     attribute:NSLayoutAttributeTop
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeTop
                                                    multiplier:1
                                                      constant:kButtonSpacing]];
    
    [self setButton:twoButton toTheRightOf:oneButton];
    [self setButton:threeButton toTheRightOf:twoButton];
    
    [self setButton:fourButton below:oneButton];
    [self setButton:fiveButton toTheRightOf:fourButton];
    [self setButton:sixButton toTheRightOf:fiveButton];
    
    [self setButton:sevenButton below:fourButton];
    [self setButton:eightButton toTheRightOf:sevenButton];
    [self setButton:nineButton toTheRightOf:eightButton];
}

- (void)setButton:(UIButton *)button below:(UIButton *)otherButton {
    [self addConstraint:[NSLayoutConstraint constraintWithItem:otherButton
                                                     attribute:NSLayoutAttributeBottom
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:button
                                                     attribute:NSLayoutAttributeTop
                                                    multiplier:1
                                                      constant:-kButtonSpacing]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:otherButton
                                                     attribute:NSLayoutAttributeCenterX
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:button
                                                     attribute:NSLayoutAttributeCenterX
                                                    multiplier:1
                                                      constant:0]];
}

- (void)setButton:(UIButton *)button toTheRightOf:(UIButton *)otherButton {
    [self addConstraint:[NSLayoutConstraint constraintWithItem:button
                                                     attribute:NSLayoutAttributeLeading
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:otherButton
                                                     attribute:NSLayoutAttributeTrailing
                                                    multiplier:1
                                                      constant:kButtonSpacing]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:otherButton
                                                     attribute:NSLayoutAttributeCenterY
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:button
                                                     attribute:NSLayoutAttributeCenterY
                                                    multiplier:1
                                                      constant:0]];
}

- (UIButton *)createNewButtonWithValue:(int)value {
    UIButton *newButton = [UIButton new];
    [newButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [newButton setBackgroundColor:[UIColor whiteColor]];
    [newButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    
    [newButton addConstraint:[NSLayoutConstraint constraintWithItem:newButton
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                         multiplier:1
                                                           constant:kButtonWidth]];
    [newButton addConstraint:[NSLayoutConstraint constraintWithItem:newButton
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                         multiplier:1
                                                           constant:kButtonWidth]];
    [self addSubview:newButton];
    [newButton setTitle:[[NSNumber numberWithInt:value] stringValue] forState:UIControlStateNormal];
    
    [newButton addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    return newButton;
}

- (void)buttonTapped:(UIButton *)button {
    [self.tile setValue:[button.titleLabel.text intValue] userSet:YES];
    [self removeFromSuperview];
}

@end
