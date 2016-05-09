//
//  ViewController.m
//  2 player math
//
//  Created by Anton Moiseev on 2016-05-09.
//  Copyright © 2016 Anton Moiseev. All rights reserved.
//

#import "ViewController.h"
#import "GameModel.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *one;
@property (weak, nonatomic) IBOutlet UIButton *two;
@property (weak, nonatomic) IBOutlet UIButton *three;
@property (weak, nonatomic) IBOutlet UIButton *four;
@property (weak, nonatomic) IBOutlet UIButton *five;
@property (weak, nonatomic) IBOutlet UIButton *six;
@property (weak, nonatomic) IBOutlet UIButton *seven;
@property (weak, nonatomic) IBOutlet UIButton *eight;
@property (weak, nonatomic) IBOutlet UIButton *nine;
@property (weak, nonatomic) IBOutlet UIButton *zero;
@property (weak, nonatomic) IBOutlet UIButton *enter;
@property (weak, nonatomic) IBOutlet UILabel *question;
@property (weak, nonatomic) IBOutlet UILabel *player1score;
@property (weak, nonatomic) IBOutlet UILabel *player2score;
@property (strong, nonatomic) GameModel *ourGame;
@property (weak, nonatomic) IBOutlet UILabel *message;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.ourGame = [[GameModel alloc] init];
    self.player1score.text = [NSString stringWithFormat:@"Player 1's score: %d", self.ourGame.player1.lives];
    self.player2score.text = [NSString stringWithFormat:@"Player 2's score: %d", self.ourGame.player2.lives];
    self.question.text = [self.ourGame generateMathQuestion];
    
    [self.one addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.two addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.three addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.four addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.five addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.six addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.seven addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.eight addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.nine addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.zero addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.enter addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed:(UIButton *) sender {
    
    if ([[self.ourGame playersTurn] isEqualToString:@"Player 1"]) {
        
        if (sender == self.zero) {
            [self.ourGame.player1.answer appendString:@"0"];
            
        } else if (sender == self.one) {
            [self.ourGame.player1.answer appendString:@"1"];
            
        } else if (sender == self.two) {
            [self.ourGame.player1.answer appendString:@"2"];
            
        } else if (sender == self.three) {
            [self.ourGame.player1.answer appendString:@"3"];
            
        } else if (sender == self.four) {
            [self.ourGame.player1.answer appendString:@"4"];
            
        } else if (sender == self.five) {
            [self.ourGame.player1.answer appendString:@"5"];
            
        } else if (sender == self.six) {
            [self.ourGame.player1.answer appendString:@"6"];
            
        } else if (sender == self.seven) {
            [self.ourGame.player1.answer appendString:@"7"];
            
        } else if (sender == self.eight) {
            [self.ourGame.player1.answer appendString:@"8"];
            
        } else if (sender == self.nine) {
            [self.ourGame.player1.answer appendString:@"9"];
            
        } else if (sender == self.enter) {
            int livesBeforeCheck = self.ourGame.player1.lives;
            [self.ourGame check];
            self.player1score.text = [NSString stringWithFormat:@"Player 1's score: %d", self.ourGame.player1.lives];
            self.player2score.text = [NSString stringWithFormat:@"Player 2's score: %d", self.ourGame.player2.lives];
            
            if (self.ourGame.player1.lives < livesBeforeCheck) {
                self.message.text = @"Incorrect, player 1 :(";
                [self.message setBackgroundColor:[UIColor redColor]];
            } else {
                
                self.message.text = @"Correct, player 1 :)";
                [self.message setBackgroundColor:[UIColor greenColor]];
            }
            if ([self.ourGame gameIsOver]) {
                
                self.question.text = @"The game is over!";
                
            } else {
                
                self.question.text = [self.ourGame generateMathQuestion];
            }
            
        }
        
    } else if ([[self.ourGame playersTurn] isEqualToString:@"Player 2"]) {
        
        if (sender == self.zero) {
            [self.ourGame.player2.answer appendString:@"0"];
            
        } else if (sender == self.one) {
            [self.ourGame.player2.answer appendString:@"1"];
            
        } else if (sender == self.two) {
            [self.ourGame.player2.answer appendString:@"2"];
            
        } else if (sender == self.three) {
            [self.ourGame.player2.answer appendString:@"3"];
            
        } else if (sender == self.four) {
            [self.ourGame.player2.answer appendString:@"4"];
            
        } else if (sender == self.five) {
            [self.ourGame.player2.answer appendString:@"5"];
            
        } else if (sender == self.six) {
            [self.ourGame.player2.answer appendString:@"6"];
            
        } else if (sender == self.seven) {
            [self.ourGame.player2.answer appendString:@"7"];
            
        } else if (sender == self.eight) {
            [self.ourGame.player2.answer appendString:@"8"];
            
        } else if (sender == self.nine) {
            [self.ourGame.player2.answer appendString:@"9"];
            
        } else if (sender == self.enter) {
            int livesBeforeCheck = self.ourGame.player2.lives;
            [self.ourGame check];
            self.player1score.text = [NSString stringWithFormat:@"Player 1's score: %d", self.ourGame.player1.lives];
            self.player2score.text = [NSString stringWithFormat:@"Player 2's score: %d", self.ourGame.player2.lives];
            
            if (self.ourGame.player2.lives < livesBeforeCheck) {
                self.message.text = @"Incorrect, player 2 :(";
                [self.message setBackgroundColor:[UIColor redColor]];
            } else {
                
                self.message.text = @"Correct, player 2 :)";
                [self.message setBackgroundColor:[UIColor greenColor]];
            }

            if ([self.ourGame gameIsOver]) {
                
                self.question.text = @"The game is over!";
                
            } else {
                
                self.question.text = [self.ourGame generateMathQuestion];
            }

        }
        
    }
    
    
}

@end
