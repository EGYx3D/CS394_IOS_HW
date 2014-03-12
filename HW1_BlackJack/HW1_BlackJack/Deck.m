//
//  Deck.m
//  BlackJackApp
//
//  Created by Reem Hassan on 3/11/14.
//  Copyright (c) 2014 Reem Hassan. All rights reserved.
//

#import "Deck.h"
#import "Card.h"

@implementation Deck

-(id) init {
    if (self = [super init]) {
        cards = [[NSMutableArray alloc] init];
        
        for (int suit = 0; suit <= 3; suit++) {
            for (int cardNumber = 1; cardNumber <= 13; cardNumber++) {
                [cards addObject:[[Card alloc] initWithCardNumber:cardNumber suit:suit]];
            }
        }
        [self shuffle];
    }
    return self;
}

-(Card *) drawCard {
    if ([cards count] > 0) {
        Card* tempCard = [cards lastObject];
        [cards removeLastObject];
        return tempCard;
    }
    return nil;
}

-(void) shuffle {
    NSUInteger count = [cards count];
    for (NSUInteger i = 0; i < count; ++i) {
        // Select a random element between i and end of array to swap with.
        int nElements = count - i;
        int n = (arc4random() % nElements) + i;
        [cards exchangeObjectAtIndex:i withObjectAtIndex:n];
    }
}

@end
