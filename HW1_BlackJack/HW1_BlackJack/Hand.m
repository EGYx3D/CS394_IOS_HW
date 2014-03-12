//
//  Hand.m
//  HW1_BlackJack
//
//  Created by Reem Hassan on 3/11/14.
//  Copyright (c) 2014 Reem Hassan. All rights reserved.
//

#import "Hand.h"
#import "Card.h"

@implementation Hand

@synthesize handClosed = _handClosed;

-(id) init {
    if ((self = [super init])){
        self.cardsInHand = [[NSMutableArray alloc] initWithCapacity:2];
        _handClosed = NO;
    }
    return (self);
}

-(NSInteger) countCards {
    return ([self.cardsInHand count]);
}

-(void) addCard:(Card *)card {
    if ((_handClosed == NO) | ( [self countCards] == 0)) {
        [self.cardsInHand addObject:card];
    }
    else {
        card.cardDown = YES;
        [self.cardsInHand addObject:card];
    }
    
}

-(NSInteger) getCardValue {
    NSInteger aValue = 0;
    NSInteger numberOfAces = 0;
    
    for (Card *tempCard in self.cardsInHand) {
        if (tempCard.cardValue == 11)
            numberOfAces = numberOfAces + 1;
        
        aValue = aValue + [tempCard cardValue];
    }
    
    while (aValue > 21 && numberOfAces > 0) {
        aValue = aValue - 10;
        numberOfAces = numberOfAces - 1;
    }
    return aValue;
}

-(Card *) getCardAtIndex:(NSInteger) index {
    return ([self.cardsInHand objectAtIndex:index]);
}

-(NSString *)description {
    return [NSString stringWithFormat:@"cards in hand : %@", self.cardsInHand];
}

-(BOOL) handClosed {
    return _handClosed;
}

-(void) setHandClosed:(BOOL)aHandClosed {
    if (aHandClosed == NO) {
        for( Card *c in self.cardsInHand)
            c.cardDown = NO;
    }
    _handClosed = aHandClosed;
}

@end
