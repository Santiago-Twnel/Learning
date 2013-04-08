//
//  Card.h
//  Matchismo
//
//  Created by Lion User on 01/04/2013.
//  Copyright (c) 2013 Lion User. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;

@property (nonatomic, getter = isFaceUp) BOOL faceUp;

@property (nonatomic, getter = isUnPlayable) BOOL unPlayable;

- (int)match:(NSArray *)otherCards;

@end
