//
//  ViewController.m
//  HW1_BlackJack
//
//  Created by Reem Hassan on 3/11/14.
//  Copyright (c) 2014 Reem Hassan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *betAmountDisplay;

@property (weak, nonatomic) IBOutlet UILabel *totalCardNumber;

@property (weak, nonatomic) IBOutlet UILabel *totalAmount;

@end

@implementation ViewController

- (IBAction)betAmountButton:(id)sender {
    //amount to bet with for each round
}

- (IBAction)hitButton:(id)sender {
    //add a card to player
}

- (IBAction)standButton:(id)sender {
    //keep cards and show
}

- (IBAction)splitButton:(id)sender {
    //
}

- (IBAction)doubleButton:(id)sender {
    //double bet and only get 1 more card
    //(hit me then stand)
}

- (IBAction)endGameButton:(id)sender {
    //closes game and resets everything
}

- (IBAction)adviceButton:(id)sender {
    //calculate the best move to make
}

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
