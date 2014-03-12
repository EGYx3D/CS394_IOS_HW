//
//  BlackjackModel.h
//  BlackJack_HW1
//
//  Created by Reem Hassan on 3/12/14.
//  Copyright (c) 2014 Reem Hassan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Hand.h"

typedef enum {
    Player,
    Dealer,
    Draw
} Winner;

@interface BlackjackModel : NSObject {
    Hand *dealerHand;
    Hand *playerHand;
    Deck *deck;
    int totalPlays;
}

@property Hand *dealerHand;
@property Hand *playerHand;
@property Deck *deck;
@property int totalPlays;

-(void) setup;
-(void) resetGame;
-(void) playerHandDraws;
-(void) playerStands;

+(BlackjackModel *)getBlackjackModel;

@end