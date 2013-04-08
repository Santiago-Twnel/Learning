//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Lion User on 01/04/2013.
//  Copyright (c) 2013 Lion User. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (readwrite, nonatomic) NSUInteger score;
@end

@implementation CardMatchingGame

- (NSUInteger)matchBonus{
    if(!_matchBonus)
        _matchBonus = 1;
    
    return _matchBonus;
}

- (NSUInteger)missMatchPenalty{
    if(!_missMatchPenalty)
        _missMatchPenalty = 1;
    
    return _missMatchPenalty;
}

- (NSUInteger)flipPenalty{
    if(!_flipPenalty)
        _flipPenalty = 0;
    
    return _flipPenalty;
}

- (void)flipCardAtIndex:(NSUInteger)index{
    Card *card = self.cards[index];
    NSString *action = nil;
    NSMutableArray *faceUps = [[NSMutableArray alloc] init];
    
    if(card && !card.isUnPlayable){
        if(!card.isFaceUp){
            action = [NSString stringWithFormat:@"Flipped up %@", card.contents];
            for(Card *otherCard in self.cards){
                if(otherCard.isFaceUp && !otherCard.isUnPlayable){
                    [faceUps addObject:otherCard];
                    if([faceUps count] == self.mode - 1){
                        break;
                    }
                }
            }
            
            if([faceUps count] == self.mode - 1){
                int matchScore = [card match:faceUps];
                if(matchScore){
                    [faceUps addObject:card];
                    for(Card *faceUpCard in faceUps){
                        faceUpCard.unPlayable = YES;
                    }
                
                    matchScore *= self.matchBonus;
                    self.score += matchScore;
                    action = [NSString stringWithFormat:@"Matched %@ for %u points!",[faceUps componentsJoinedByString:@" & "], matchScore];
                } else{
                    [faceUps addObject:card];
                    for(Card *faceUpCard in faceUps){
                        faceUpCard.faceUp = NO;
                    }
                    matchScore = self.missMatchPenalty;
                    self.score -= matchScore;
                    action = [NSString stringWithFormat:@"%@ don't match! %u point penalty!", [faceUps componentsJoinedByString:@" and "], matchScore];
                }
            }
            self.score -= self.flipPenalty;
        } else{
            action = [NSString stringWithFormat:@"Flipped down %@", card.contents];
        }
        [self.actions addObject:action];
        card.faceUp = !card.isFaceUp;
    }
}
@end
