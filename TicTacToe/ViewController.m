//
//  ViewController.m
//  TicTacToe
//
//  Created by Anders Chaplin on 5/14/15.
//  Copyright (c) 2015 ___AndersChaplin___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UILabel *label3;
@property (weak, nonatomic) IBOutlet UILabel *label4;
@property (weak, nonatomic) IBOutlet UILabel *label5;
@property (weak, nonatomic) IBOutlet UILabel *label6;
@property (weak, nonatomic) IBOutlet UILabel *label7;
@property (weak, nonatomic) IBOutlet UILabel *label8;
@property (weak, nonatomic) IBOutlet UILabel *label9;
@property (weak, nonatomic) IBOutlet UILabel *whichPlayerLabel;

@property int turn;
@property int currentPlayer;

@property NSArray *labelsArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.labelsArray = [NSArray arrayWithObjects:self.label1, self.label2, self.label3, self.label4, self.label5, self.label6, self.label7, self.label8, self.label9, nil];
    self.turn = 1;
    self.currentPlayer = 1;
    self.whichPlayerLabel.text = [NSString stringWithFormat:@"Now it's Player %d's turn", self.currentPlayer];
}



- (IBAction)onLabelTapped:(UITapGestureRecognizer *)sender {
    self.turn++;
    CGPoint tappedPoint = [sender locationInView:self.view];
    [self findLabelUsingPoint:tappedPoint];
}



- (void)findLabelUsingPoint:(CGPoint)point {
    if(self.turn%2 > 0) {
        self.currentPlayer = 1;
    } else {
        self.currentPlayer = 2;
    }

    self.whichPlayerLabel.text = [NSString stringWithFormat:@"Now it's Player %d's turn", self.currentPlayer];

    for (UILabel *label in self.labelsArray) {
        if(CGRectContainsPoint(label.frame, point)) {
            if (self.currentPlayer == 1) {
                label.textColor = [UIColor blueColor];
                label.text = @"X";
            } else {
                label.textColor = [UIColor redColor];
                label.text = @"O";
            }
        }
    }
}

@end
