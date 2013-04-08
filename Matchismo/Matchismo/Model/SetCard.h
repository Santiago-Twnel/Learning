//
//  SetCard.h
//  Matchismo
//
//  Created by Lion User on 04/04/2013.
//  Copyright (c) 2013 Lion User. All rights reserved.
//

FOUNDATION_EXPORT NSUInteger const NO_SHADOW;
FOUNDATION_EXPORT NSUInteger const LIGHT_SHADOW;
FOUNDATION_EXPORT NSUInteger const SHADOW;

#import <Foundation/Foundation.h>
#import "Card.h"

@interface SetCard : Card

@property (strong, nonatomic) NSString *suit;

@property (nonatomic) NSUInteger rank;

@property (strong, nonatomic) NSString *color;

@property (nonatomic) NSUInteger shadow;

+ (NSArray *)validColors;

+ (NSUInteger)maxRank;

+ (NSArray *)validSuits;

@end
