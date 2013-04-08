//
//  Card.m
//  Matchismo
//
//  Created by Lion User on 01/04/2013.
//  Copyright (c) 2013 Lion User. All rights reserved.
//

#import "Card.h"

@implementation Card

- (int)match:(NSArray *)otherCards{
    NSInteger score = 0;
    
    for(Card *card in otherCards){
        if([card.contents isEqualToString:self.contents]){
            score = 1;
        }
    }
    
    return  score;
}

- (NSString *)description{
    return self.contents;
}

@end
