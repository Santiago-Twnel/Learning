//
//  BasicViewController.m
//  Matchismo
//
//  Created by Lion User on 03/04/2013.
//  Copyright (c) 2013 Lion User. All rights reserved.
//

#import "BasicViewController.h"
#import "Game.h"

@interface BasicViewController ()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardsOutlet;
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *actionLabel;
@property (weak, nonatomic) IBOutlet UISlider *storySlider;
@property (nonatomic) NSInteger count;
@property (strong, nonatomic) Game *game;
@end

@implementation BasicViewController

- (void)setCardsOutlet:(NSArray *)cardsOutlet{
    _cardsOutlet = cardsOutlet;
    [self updateUI];
}

- (void)setStorySlider:(UISlider *)storySlider{
    _storySlider = storySlider;
    [self.storySlider setValue:0];
    self.storySlider.enabled = NO;
}

- (void)setActionLabel:(UILabel *)actionLabel{
    _actionLabel = actionLabel;
    self.actionLabel.text = @"";
}

- (void)setCount:(NSInteger)count{
    _count = count;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.count];
}

- (NSUInteger)countCards{
    return [self.cardsOutlet count];
}

- (void)updateUI{
    for(UIView *button in self.cardsOutlet){
        Card *card = [self.game cardAtIndex:[self.cardsOutlet indexOfObject:button]];
        
        [self printUI:button withCard:card];
    }
    self.scoreLabel.text = [NSString stringWithFormat: @"Score: %d", self.game.score];
    self.actionLabel.text = self.game.lastAction? self.game.lastAction: @"";
    
    if([self.game actionsCount] > 0){
        self.storySlider.maximumValue = [self.game actionsCount];
        [self.storySlider setValue:self.storySlider.maximumValue];
        self.storySlider.enabled = YES;
    } else{
        [self.storySlider setValue:0];
        self.storySlider.enabled = NO;
    }
}

- (void)printUI:(UIView *) view withCard:(Card *) card{
    // Implementation left for subClass.
}

- (IBAction)flipCard:(UIButton *)sender {
    [self.game flipCardAtIndex:[self.cardsOutlet indexOfObject:sender]];
    self.count++;
    self.actionLabel.alpha = 1;
    [self updateUI];
}

- (IBAction)storySlider:(UISlider *)sender {
    NSUInteger val = lroundf(sender.value);
    
    if(val){
        if(val == sender.maximumValue){
            self.actionLabel.text = [self.game lastAction];
            self.actionLabel.alpha = 1;
        } else{
            self.actionLabel.text = [self.game actionAtIndex:val - 1];
            self.actionLabel.alpha = 0.5;
        }
    } else{
        self.actionLabel.text = @"";
    }
}

- (void)deal{
    self.count = 0;
    [self updateUI];
}


@end
