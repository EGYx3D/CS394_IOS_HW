//
//  Card.h
//  BlackJack_HW1
//
//  Created by Reem Hassan on 3/12/14.
//  Copyright (c) 2014 Reem Hassan. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    Hearts,
    Spades,
    Diamonds,
    Clubs
} Suit;

@interface Card : NSObject{
}


@property NSInteger cardNumber;
@property Suit suit;
@property BOOL cardClosed;


-(id) initWithCardNumber:(NSInteger) aCardNumber suit:(Suit) aSuit;
-(NSInteger) pipValue;
-(NSString *) filename;

@end