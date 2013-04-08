//
//  SetDeck.m
//  Matchismo
//
//  Created by Twnel Inc. on 4/8/13.
//  Copyright (c) 2013 Lion User. All rights reserved.
//

#import "SetDeck.h"

@implementation SetDeck

- (id)init{
    self = [super init];
    
    if(self){
        for(NSString *suit in [SetCard validSuits]){
            for(NSUInteger rank = 1; rank <= [SetCard maxRank]; rank++){
                for(NSString *color in [SetCard validColors]){
                    SetCard *card = [[SetCard alloc] init];
                    card.rank = rank;
                    card.suit = suit;
                    card.color = color;
                    card.shadow = 1;
                    [self addCard:[card copy] atTop:YES];
                    
                    card = [[SetCard alloc] init];
                    card.rank = rank;
                    card.suit = suit;
                    card.color = color;
                    card.shadow = 1;
                    [self addCard:[card copy] atTop:YES];
                    
                    card = [[SetCard alloc] init];
                    card.rank = rank;
                    card.suit = suit;
                    card.color = color;
                    card.shadow = 1;
                    [self addCard:[card copy] atTop:YES];
                }
            }
        }
    }
    
    return  self;
}

@end
