//
//  SetCard.h
//  Matchismo
//
//  Created by Lion User on 04/04/2013.
//  Copyright (c) 2013 Lion User. All rights reserved.
//

NSUInteger const NO_SHADOW = 0;
NSUInteger const LIGHT_SHADOW = 1;
NSUInteger const SHADOW = 2;

#import <Foundation/Foundation.h>
#import "PlayingCard.h"

@interface SetCard : NSObject

@property (strong, nonatomic) NSString *suit;

@property (nonatomic) NSUInteger rank;

@property (strong, nonatomic) NSString *color;

@property (nonatomic) NSUInteger shadow;

+ (NSArray *)validColors;

@end
