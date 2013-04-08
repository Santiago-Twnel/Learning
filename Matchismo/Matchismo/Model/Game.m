//
//  Game.m
//  Matchismo
//
//  Created by Lion User on 03/04/2013.
//  Copyright (c) 2013 Lion User. All rights reserved.
//

#import "Game.h"

NSUInteger const TWO_CARD_MODE = 2;
NSUInteger const THREE_CARD_MODE = 3;

@interface Game()
@property (readwrite, nonatomic) NSUInteger score;
@end

@implementation Game

// Overwrite init
- (id)init{
    self = nil;
    return self;
}

- (id)initWithCardCount:(NSUInteger)count
              usingDeck:(Deck *)deck
                 inMode:(NSUInteger) mode{
    self = [super init];
    
    if(self){
        self.mode = mode;
        
        for(int i = 0; i < count; i++){
            Card *card = [deck drawRandomCard];
            
            if(card)
                self.cards[i] = card;
            else{
                self = nil;
                break;
            }
        }
    }
    
    return self;
}

- (NSMutableArray *)cards{
    if(!_cards)
        _cards = [[NSMutableArray alloc] init];
    
    return _cards;
}

- (NSMutableArray *)actions{
    if(!_actions)
        _actions = [[NSMutableArray alloc] init];
    
    return _actions;
}

- (BOOL)resetWithCardCount: (NSUInteger)count
                 usingDeck: (Deck *)deck
                    inMode: (NSUInteger)mode{
    BOOL ret = YES;
    
    self.cards = [[NSMutableArray alloc] init];
    self.actions = [[NSMutableArray alloc] init];
    self.score = 0;
    self.mode = mode;
    
    for(int i = 0; i < count; i++){
        Card *card = [deck drawRandomCard];
        
        if(card)
            self.cards[i] = card;
        else{
            ret = NO;
            break;
        }
    }
    
    return ret;
}

- (void)flipCardAtIndex:(NSUInteger)index{
    // Declare at subclass.
}

- (Card *)cardAtIndex:(NSUInteger)index{
    return index < [self.cards count]? self.cards[index]: nil;
}

- (NSUInteger)actionsCount{
    return [self.actions count];
}

- (NSString *)actionAtIndex:(NSUInteger)index{
    return index < [self.actions count]? self.actions[index]: [self.actions lastObject];
}

- (NSString *)lastAction{
    return [self.actions lastObject];
}
@end
