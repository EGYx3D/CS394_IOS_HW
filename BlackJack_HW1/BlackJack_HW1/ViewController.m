//
//  ViewController.m
//  BlackJack_HW1
//
//  Created by Reem Hassan on 3/12/14.
//  Copyright (c) 2014 Reem Hassan. All rights reserved.
//

#import "ViewController.h"
#import "BlackjackModel.h"
#import "Hand.h"
#import "Card.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize dealerLabel=_dealerLabel, playerLabel=_playerLabel, HitButton=_HitButton, standButton=_standButton, doubleButton = _doubleButton, resetButton = _resetButton, gameWinner = _gameWinner, dealerValue = _dealerValue, playerValue = _playerValue, adviceButton = _adviceButton, adviceLabel = _adviceLabel, allImageViews =_allImageViews;


- (void)viewWillAppear:(BOOL)animated {
    
}

-(void) viewDidDisappear:(BOOL)animated {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _allImageViews = [[NSMutableArray alloc] initWithCapacity:5];
    
    // Do any additional setup after loading the view, typically from a nib.
    [[BlackjackModel getBlackjackModel]  addObserver:self forKeyPath:@"dealerHand"
                                             options:NSKeyValueObservingOptionNew context:NULL];
    [[BlackjackModel getBlackjackModel]  addObserver:self forKeyPath:@"playerHand"
                                             options:NSKeyValueObservingOptionNew context:NULL];
    [[BlackjackModel getBlackjackModel]  addObserver:self forKeyPath:@"totalPlays"
                                             options:NSKeyValueObservingOptionNew context:NULL];
    
    [[BlackjackModel getBlackjackModel] setup];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) showHand:(Hand *)hand atYPos:(NSInteger) yPos; {
    for (int i=0; i< [hand countCards] ; i++) {
        Card *card = [hand getCardAtIndex:i];
        
        UIImage  *cardImage = [ UIImage imageNamed:[card filename]];
        
        UIImageView *imageView=[[UIImageView alloc] initWithImage:cardImage];
        CGRect arect = CGRectMake( (i*40)+20, yPos, 71, 96);
        imageView.frame = arect;
        
        [_allImageViews addObject:imageView];
        
        [self.view addSubview:imageView];
    }
}

-(void) revealWinner {
    //if player points greater & none busted or if dealer busts
    if((_playerValue <= 21 && _dealerValue <= 21 && _playerValue > _dealerValue) || (_dealerValue > 21 && _playerValue <= 21)) {
        _gameWinner.text = [NSString stringWithFormat:@"YAY! You Win :)"];
    }
    //if dealer points greater & none busted or if player busts
    else if((_playerValue <= 21 && _dealerValue <= 21 && _playerValue < _dealerValue) || (_playerValue > 21 && _dealerValue <= 21)) {
        _gameWinner.text = [NSString stringWithFormat:@"Dealer Wins :("];
    }
    //if points equal (or if both bust?)
    //else if(_playerValue == _dealerValue) {
    else {
        _gameWinner.text = [NSString stringWithFormat:@"It's a Draw :O"];
    }
}

-(void) showDealerHand:(Hand *)hand; {
    //show the hand of the dealer
    [self showHand:hand atYPos:80];
    _dealerLabel.text = [NSString stringWithFormat:@"Dealer (%d)",[hand getPipValue]];
    _dealerValue = [hand getPipValue];
}

-(void) showPlayerHand:(Hand *)hand; {
    //shows the players hand
    [self showHand:hand atYPos:290];
    _playerLabel.text = [NSString stringWithFormat:@"Player (%d)",[hand getPipValue]];
    _playerValue = [hand getPipValue];
}


- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context {
    
    if ([keyPath isEqualToString:@"dealerHand"]) {
        [self showDealerHand: (Hand *)[object dealerHand]];
    }
    else
        if ([keyPath isEqualToString:@"playerHand"]) {
            [self showPlayerHand: (Hand *)[object playerHand]];
        }
        else if ([keyPath isEqualToString:@"totalPlays"]) {
            [self endGame];
        }
}

- (IBAction)HitCard:(id)sender {
    //add 1 more card
    _adviceLabel.text = [NSString stringWithFormat:(@"ADVICE")];
    [[BlackjackModel getBlackjackModel] playerHandDraws];
}

- (IBAction)Stand:(id)sender {
    //ends game
    _adviceLabel.text = [NSString stringWithFormat:(@"ADVICE")];
    [_HitButton setEnabled:NO];
    [_standButton setEnabled:NO];
    [_doubleButton setEnabled:NO];
    [_adviceButton setEnabled:NO];
    [_resetButton setEnabled:NO];
    
    [[BlackjackModel getBlackjackModel] playerStands];
}

- (IBAction)Double:(id)sender {
    //hit plus stand code to add 1 card then end game
    _adviceLabel.text = [NSString stringWithFormat:(@"ADVICE")];
    [[BlackjackModel getBlackjackModel] playerHandDraws];
    
    [_HitButton setEnabled:NO];
    [_standButton setEnabled:NO];
    [_doubleButton setEnabled:NO];
    [_adviceButton setEnabled:NO];
    [_resetButton setEnabled:NO];
    
    [[BlackjackModel getBlackjackModel] playerStands];
}

- (IBAction)Advice:(id)sender {
    //if playValue is less than 10, then advise to double
    //or if playerValue is between 10 & 17, then advise to hit.
    //otherwise stay. simple advice for now
    if(_playerValue >= 10 && _playerValue <= 12) {
        _adviceLabel.text = [NSString stringWithFormat:(@"Double")];
    }
    else if(_playerValue >= 17) {
        _adviceLabel.text = [NSString stringWithFormat:(@"Stand")];
    }
    else {
        _adviceLabel.text = [NSString stringWithFormat:(@"Hit")];
    }
}

- (IBAction)ResetGame:(id)sender {
    //starts a new game
    _gameWinner.text = nil;
    _adviceLabel.text = [NSString stringWithFormat:(@"ADVICE")];
    [_HitButton setEnabled:YES];
    [_standButton setEnabled:YES];
    [_doubleButton setEnabled:YES];
    [_adviceButton setEnabled:YES];
    
    //
    // reset the model
    for (UIView *view in _allImageViews) {
        [view removeFromSuperview];
    }
    [_allImageViews removeAllObjects];
    [_dealerLabel setText:@"Dealer"];
    [_playerLabel setText:@"Player"];
    [_resetButton setEnabled:NO];
    
    [[BlackjackModel getBlackjackModel] resetGame];
}

-(void) endGame {
    //game is ended, can only start a new game
    _adviceLabel.text = [NSString stringWithFormat:(@"ADVICE")];
    [self revealWinner];
    [_HitButton setEnabled:NO];
    [_standButton setEnabled:NO];
    [_doubleButton setEnabled:NO];
    [_adviceButton setEnabled:NO];
    [_resetButton setEnabled:YES];
}

@end