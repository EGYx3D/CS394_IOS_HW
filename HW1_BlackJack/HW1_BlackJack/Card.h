//
//  Card.h
//  BlackJackApp
//
//  Created by Reem Hassan on 3/11/14.
//  Copyright (c) 2014 Reem Hassan. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    Hearts,
    Spades,
    Diamonds,
    Clubs
} Suit;

@interface Card : NSObject

@property (nonatomic) Suit suit;
@property (nonatomic) NSInteger number;
@property BOOL cardDown;

-(id) initWithCardNumber:(NSInteger) aCardNumber suit:(Suit) aSuit;
-(NSInteger) cardValue;
-(NSString *) filename;

@end
