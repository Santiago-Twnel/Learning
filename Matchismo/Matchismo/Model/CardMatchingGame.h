//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Lion User on 01/04/2013.
//  Copyright (c) 2013 Lion User. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Game.h"
#import "Card.h"
#import "Deck.h"

FOUNDATION_EXPORT NSUInteger const TWO_CARD_MODE;
FOUNDATION_EXPORT NSUInteger const THREE_CARD_MODE;

@interface CardMatchingGame : Game
@property (nonatomic) NSUInteger matchBonus;
@property (nonatomic) NSUInteger missMatchPenalty;
@property (nonatomic) NSUInteger flipPenalty;
@end