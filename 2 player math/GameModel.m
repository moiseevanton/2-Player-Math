//
//  GameModel.m
//  2 player math
//
//  Created by Anton Moiseev on 2016-05-09.
//  Copyright © 2016 Anton Moiseev. All rights reserved.
//

#import "GameModel.h"

@implementation GameModel

- (instancetype) init {
    
    self = [super init];
    
    if (self) {
        
        _player1 = [[Player alloc] init];
        _player2 = [[Player alloc] init];
        _correctAnswer = nil;
        
    }
    return self;
}

- (NSString *)generateMathQuestion {
    
    int r = arc4random_uniform(9);
    
    int X = 1 + arc4random_uniform(19);
    
    int Y = 1 + arc4random_uniform(19);
    
    if (r < 3) {
        
        int correct = (X * Y);
        
        self.correctAnswer = [NSMutableString stringWithFormat:@"%d", correct];
        
        NSString *turn = [self playersTurn];
        
        NSString *randomQuestion = [[NSString alloc] initWithFormat:@"%@: %d * %d", turn, X, Y];
        
        return randomQuestion;
        
    } else if (r >= 3 && r < 6 && X >= Y) {
        
        int correct = (X - Y);
        
        self.correctAnswer = [NSMutableString stringWithFormat:@"%d", correct];
        
        NSString *turn = [self playersTurn];
        
        NSString *randomQuestion = [[NSString alloc] initWithFormat:@"%@: %d - %d", turn, X, Y];
        
        return randomQuestion;
        
    } else {
        
        int correct = (X + Y);
        
        self.correctAnswer = [NSMutableString stringWithFormat:@"%d", correct];
        
        NSString *turn = [self playersTurn];
        
        NSString *randomQuestion = [[NSString alloc] initWithFormat:@"%@: %d + %d", turn, X, Y];
        
        return randomQuestion;
    }
}

- (NSString *)playersTurn {
    
    if (self.player1.turns == 0 && self.player2.turns == 0) {
        
        return @"Player 1";
        
    } else if (self.player1.turns > self.player2.turns) {
        
        return @"Player 2";
        
    } else if (self.player1.turns == self.player2.turns) {
        
        return @"Player 1";
    } else {
        return nil;
    }
}

- (void)check {
    
    if ([[self playersTurn] isEqualToString:@"Player 1"]) {
        
        if ([self.correctAnswer isEqualToString:self.player1.answer]) {
            self.player1.lives += 0;
            
        } else {
            
            self.player1.lives -= 1;
        }
        self.player1.turns += 1;
        self.player1.answer = [[NSMutableString alloc] init];
        
    } else if ([[self playersTurn] isEqualToString:@"Player 2"]) {
        
        if ([self.correctAnswer isEqualToString:self.player2.answer]) {
            self.player2.lives +=0;
        } else {
            
            self.player2.lives -=1;
        }
        self.player2.turns += 1;
        self.player2.answer = [[NSMutableString alloc] init];
    }
}

- (BOOL)gameIsOver {
    
    return (self.player1.lives == 0 || self.player2.lives == 0);
}

@end
