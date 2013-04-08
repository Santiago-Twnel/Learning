//
//  PlayingCard.m
//  Matchismo
//
//  Created by Lion User on 01/04/2013.
//  Copyright (c) 2013 Lion User. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

+ (NSArray *)rankStrings{
    static NSArray *rankStrings = nil;
    if(!rankStrings) rankStrings = @[@"?", @"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
    return rankStrings;
}

- (int)match:(NSArray *)otherCards{
    int score = 0;
    
    if([otherCards count] == 1){
        Card *rawCard = [otherCards lastObject];
        if([rawCard isKindOfClass:[PlayingCard class]]){
            PlayingCard *otherCard = (PlayingCard *)rawCard;
            if(self.rank == otherCard.rank){
                score = 4;
            } else if([self.suit isEqualToString:otherCard.suit]){
                score = 1;
            }
        }
    } else if([otherCards count] == 2){
        if([otherCards[0] isKindOfClass:[PlayingCard class]] && [otherCards[1] isKindOfClass:[PlayingCard class]]){
            PlayingCard *otherCard1 = otherCards[0];
            PlayingCard *otherCard2 = otherCards[1];
            
            if(self.rank == otherCard1.rank && self.rank == otherCard2.rank){
                score = 8;
            } else if([self.suit isEqualToString:otherCard1.suit] && [self.suit isEqualToString:otherCard2.suit]){
                score = 3;
            }
        }
    }
    
    return score;
}

- (NSString *)contents{
    return [[[PlayingCard rankStrings] objectAtIndex:self.rank] stringByAppendingString:self.suit];
}

+ (NSArray *)validSuits{
    static NSArray *validSuits = nil;
    if(!validSuits) validSuits = @[@"♠", @"♣", @"♥", @"♦"];
    return validSuits;
}

+ (NSUInteger)maxRank{
    return [PlayingCard rankStrings].count-1;
}

- (void)setRank:(NSUInteger)rank{
    if(rank <= [PlayingCard maxRank])
        _rank = rank;
}

@synthesize suit = _suit;

- (void)setSuit:(NSString *)suit{
    if([[PlayingCard validSuits] containsObject:suit])
        _suit = suit;
}

- (NSString *)suit{
    return _suit? _suit: @"?";
}

@end
