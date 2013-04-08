//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Lion User on 31/03/2013.
//  Copyright (c) 2013 Lion User. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface CardGameViewController ()
@property (strong, nonatomic) CardMatchingGame *game;
@end

@implementation CardGameViewController

- (CardMatchingGame *)game{
    if(!_game)
        _game = [[CardMatchingGame alloc] initWithCardCount:[self countCards] usingDeck:[[PlayingCardDeck alloc] init] inMode: TWO_CARD_MODE];
    
    return _game;
}

- (void)printUI:(UIView *) view withCard:(Card *) card{
    if([view isKindOfClass:[UIButton class]]){
        UIButton *button = (UIButton *)view;
        [button setTitle:card.contents forState:UIControlStateSelected];
        [button setTitle:card.contents forState:UIControlStateSelected | UIControlStateDisabled];
        button.selected = card.isFaceUp;
        button.enabled = !card.isUnPlayable;
        button.alpha = card.isUnPlayable? 0.3: 1;
        
        if(card.isFaceUp){
            [button setImage:nil forState:UIControlStateNormal];
        } else{
            UIImage *cardImage = [UIImage imageNamed:@"cardBack.jpg"];
            [button setImage:cardImage forState:UIControlStateNormal];
            button.imageEdgeInsets = UIEdgeInsetsMake(6, 6, 6, 6);
        }
    }
}

- (IBAction)dealReset {
    [self.game resetWithCardCount:[self countCards]usingDeck:[[PlayingCardDeck alloc] init] inMode:TWO_CARD_MODE];
    [self deal];
}

@end
