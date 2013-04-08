//
//  Game.h
//  Matchismo
//
//  Created by Lion User on 03/04/2013.
//  Copyright (c) 2013 Lion User. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
#import "Deck.h"

FOUNDATION_EXPORT NSUInteger const TWO_CARD_MODE;
FOUNDATION_EXPORT NSUInteger const THREE_CARD_MODE;

@interface Game : NSObject

@property (readonly, nonatomic) NSUInteger score;
@property (nonatomic) NSUInteger mode;
@property (strong, nonatomic) NSMutableArray *cards;
@property (strong, nonatomic) NSMutableArray *actions;

// Designated initializer
- (id)initWithCardCount:(NSUInteger) count
              usingDeck:(Deck *) deck inMode:(NSUInteger)mode;

- (void)flipCardAtIndex:(NSUInteger) index;

- (Card *)cardAtIndex:(NSUInteger) index;

- (NSUInteger)actionsCount;

- (NSString *)lastAction;

- (NSString *)actionAtIndex:(NSUInteger)index;

- (BOOL)resetWithCardCount: (NSUInteger)count usingDeck: (Deck *)deck inMode:(NSUInteger)mode;

@end
