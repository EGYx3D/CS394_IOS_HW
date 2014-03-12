//
//  Hand.h
//  BlackJack_HW1
//
//  Created by Reem Hassan on 3/12/14.
//  Copyright (c) 2014 Reem Hassan. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Card;

@interface Hand : NSObject {
}

@property NSMutableArray *cardsInHand;
@property BOOL handClosed;

-(void) addCard:(Card *)card;
-(NSInteger) getPipValue;
-(NSInteger) countCards;
-(Card *) getCardAtIndex:(NSInteger) index;

@end
