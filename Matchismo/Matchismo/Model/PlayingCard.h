//
//  PlayingCard.h
//  Matchismo
//
//  Created by Lion User on 01/04/2013.
//  Copyright (c) 2013 Lion User. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;

@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;

+ (NSUInteger)maxRank;

@end
