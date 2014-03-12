//
//  GameTable.m
//  HW1_BlackJack
//
//  Created by Reem Hassan on 3/11/14.
//  Copyright (c) 2014 Reem Hassan. All rights reserved.
//

#import "GameTable.h"

@implementation GameTable

@synthesize deck = _deck, dealerHand=_dealerHand, playerHand=_playerHand, totalPlays=_totalPlays;

static GameTable* gameTable = nil;

-(id) init {
    if ((self = [super init])){
        _deck = [[Deck alloc] init];
        _playerHand = [[Hand alloc] init];
        _dealerHand = [[Hand alloc] init];
        _dealerHand.handClosed = YES;
        _totalPlays = 0;
    }
    return (self);
}

-(void)setup {
    //deal cards
    [self playerHandDraws];
    [self dealerHandDraws];
    
    [self playerHandDraws];
    [self dealerHandDraws];
    
}

-(void)dealerHandDraws {
    [self willChangeValueForKey:@"dealerHand"];
    [_dealerHand addCard:[_deck drawCard]];
    [self didChangeValueForKey:@"dealerHand"];
}

-(void)playerHandDraws {
    [self willChangeValueForKey:@"playerHand"];
    [_playerHand addCard:[_deck drawCard]];
    [self didChangeValueForKey:@"playerHand"];
    [self EndGameIfPlayerIsBust];
}

-(void)dealerStartsTurn {
    [self willChangeValueForKey:@"dealerHand"];
    [_dealerHand setHandClosed:NO];
    [self didChangeValueForKey:@"dealerHand"];
}

-(void)playerStands {
    [self dealerStartsTurn];
    [self dealerPlays];
}

-(void) EndGameIfPlayerIsBust {
    if (_playerHand.getCardValue > 21)
        [self gameEnds:Dealer];
}

-(void) gameEnds:(Winner) winner; {
    self.totalPlays = self.totalPlays+1;
}

-(void) resetGame; {
    _deck = nil;
    _playerHand = nil;
    _dealerHand = nil;
    _deck = [[Deck alloc] init];
    _playerHand = [[Hand alloc] init];
    _dealerHand = [[Hand alloc] init];
    _dealerHand.handClosed = YES;
    [self setup];
}

-(void)dealerPlays {
    while (_dealerHand.getCardValue < 17) {
        [self dealerHandDraws];
        
    }
    
    if (_dealerHand.getCardValue > 21)
        [self gameEnds:Player ];
    else if (_dealerHand.getCardValue > _playerHand.getCardValue)
        [self gameEnds:Dealer];
    else
        [self gameEnds:Draw ];
}

+(GameTable *) getGameTable {
    if (gameTable == nil) {
        gameTable = [[GameTable alloc] init];
    }
    return gameTable;
}

@end
