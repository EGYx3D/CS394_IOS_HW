//
//  Card.m
//  BlackJackApp
//
//  Created by Reem Hassan on 3/4/14.
//  Copyright (c) 2014 Reem Hassan. All rights reserved.
//

#import "Card.h"

@implementation Card

@synthesize suit= _suit, number= _cardNumber, cardDown= _cardDown;

//initializing
-(id) initWithCardNumber:(NSInteger)aCardNumber suit:(Suit)aSuit {
    if (self = [super init]) {
        _suit = aSuit;
        _cardNumber = aCardNumber;
        _cardDown = NO;
    }
    return self;
}

//values of each card
-(NSInteger) cardValue {
    if (_cardDown == YES) {
        return (0);
    }
    else if (_cardNumber>=10)
        return (10);
    else if (_cardNumber==1)
        return (11);
    else
        return (_cardNumber);
}

//suits as strings
-(NSString *) suitAsString{
    switch (_suit) {
        case Hearts:
            return @"Heart";
            break;
        case Spades:
            return @"Spade";
            break;
        case Diamonds:
            return @"Diamond";
            break;
        case Clubs:
            return @"Club";
            break;
        default:
            return nil;
            break;
    }
}

//numbers as strings
-(NSString *) cardNumberAsString {
    switch (_cardNumber) {
        case 1:
            return @"Ace";
            break;
        case 11:
            return @"Jack";
            break;
        case 12:
            return @"Queen";
            break;
        case 13:
            return @"King";
            break;
        default:
            return [NSString stringWithFormat:@"%d", _cardNumber];
            break;
    }
}

//printing out the image
-(NSString *) filename {
    if (_cardDown == YES)
        return @"cardDown.png";
    else
        return [NSString stringWithFormat:@"%@%02d.png", [self suitAsString], [self number]];
}

@end