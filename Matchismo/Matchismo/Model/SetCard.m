//
//  SetCard.m
//  Matchismo
//
//  Created by Lion User on 04/04/2013.
//  Copyright (c) 2013 Lion User. All rights reserved.
//


NSUInteger const NO_SHADOW = 0;
NSUInteger const LIGHT_SHADOW = 1;
NSUInteger const SHADOW = 2;

#import "SetCard.h"

@implementation SetCard

+ (NSArray *)rankStrings{
    static NSArray *rankStrings = nil;
    if(!rankStrings) rankStrings = @[@"1", @"2", @"3"];
    return rankStrings;
}

- (int)match:(NSArray *)otherCards{
    int score = 0;
    
    if([otherCards count] == 2){
        if([otherCards[0] isKindOfClass:[SetCard class]] && [otherCards[1] isKindOfClass:[SetCard class]]){
            SetCard *otherCard1 = otherCards[0];
            SetCard *otherCard2 = otherCards[1];
            
            if(self.rank == otherCard1.rank && self.rank == otherCard2.rank){
                score = 1;
            } else if(self.rank != otherCard1.rank && self.rank != otherCard2.rank && otherCard1.rank != otherCard2.rank){
                score = 1;
            } else if([self.suit isEqualToString:otherCard1.suit] && [self.suit isEqualToString:otherCard2.suit]){
                score = 1;
            } else if(![self.suit isEqualToString:otherCard1.suit] && ![self.suit isEqualToString:otherCard2.suit] && ![otherCard1.suit isEqualToString:otherCard2.suit]){
                score = 1;
            } else if([self.color isEqualToString:otherCard1.color] && [self.color isEqualToString:otherCard2.color]){
                score = 1;
            } else if(![self.color isEqualToString:otherCard1.color] && ![self.color isEqualToString:otherCard2.color] && ![otherCard1.color isEqualToString:otherCard2.color]){
                score = 1;
            } else if(self.shadow == otherCard1.shadow && self.shadow == otherCard2.shadow){
                score = 1;
            } else if(self.shadow != otherCard1.shadow && self.shadow != otherCard2.shadow && otherCard1.shadow != otherCard2.shadow){
                score = 1;
            }
        }
    }
    
    return score;
}

- (NSString *)contents{
    NSString *result = nil;
    
    for(int i = 0; i < self.rank; i++){
        result = [result stringByAppendingString:self.suit];
    }
    
    return result;
}

+ (NSArray *)validSuits{
    static NSArray *validSuits = nil;
    if(!validSuits) validSuits = @[@"▲", @"●", @"■"];
    return validSuits;
}

+ (NSUInteger)maxRank{
    return 3;
}

- (void)setRank:(NSUInteger)rank{
    if(rank <= [SetCard maxRank])
        _rank = rank;
}

@synthesize suit = _suit;

- (void)setSuit:(NSString *)suit{
    if([[SetCard validSuits] containsObject:suit])
        _suit = suit;
}

- (NSString *)suit{
    return _suit? _suit: @"";
}

+ (NSArray *)validColors{
    static NSArray *validColors = nil;
    if(!validColors) validColors = @[@"green", @"blue", @"red"];
    return validColors;
}

- (void)setColor:(NSString *)color{
    if([[SetCard validColors] containsObject:color])
        _color = color
        ;
}

@end
