//
//  GameTable.h
//  HW1_BlackJack
//
//  Created by Reem Hassan on 3/11/14.
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

@interface GameTable : NSObject {
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

+(GameTable *)getGameTable;

@end
