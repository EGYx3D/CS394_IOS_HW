//
//  ViewController.h
//  BlackJack_HW1
//
//  Created by Reem Hassan on 3/12/14.
//  Copyright (c) 2014 Reem Hassan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    NSMutableArray *allImageViews;
    
}

@property (weak, nonatomic) IBOutlet UIBarButtonItem *HitButton;
@property (weak, nonatomic) IBOutlet UILabel *dealerLabel;
@property (weak, nonatomic) IBOutlet UILabel *playerLabel;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doubleButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *standButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *resetButton;
@property (weak, nonatomic) IBOutlet UIButton *adviceButton;
@property (weak, nonatomic) IBOutlet UILabel *adviceLabel;
@property (weak, nonatomic) IBOutlet UILabel *gameWinner;

@property int dealerValue;
@property int playerValue;

@property NSMutableArray *allImageViews;

- (IBAction)HitCard:(id)sender;
- (IBAction)Stand:(id)sender;
- (IBAction)Double:(id)sender;
- (IBAction)Advice:(id)sender;
- (IBAction)ResetGame:(id)sender;

@end