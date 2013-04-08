//
//  Deck.h
//  Matchismo
//
//  Created by Lion User on 01/04/2013.
//  Copyright (c) 2013 Lion User. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;

- (Card *)drawRandomCard;

@end
