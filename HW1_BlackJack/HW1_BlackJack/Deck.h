//
//  Deck.h
//  BlackJackApp
//
//  Created by Reem Hassan on 3/11/14.
//  Copyright (c) 2014 Reem Hassan. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Card;

@interface Deck : NSObject {
    NSMutableArray *cards;
}

-(Card *) drawCard;
-(void) shuffle;

@end
