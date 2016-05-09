//
//  GameModel.h
//  2 player math
//
//  Created by Anton Moiseev on 2016-05-09.
//  Copyright © 2016 Anton Moiseev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"

@interface GameModel : NSObject

@property Player *player1;

@property Player *player2;

@property NSMutableString *correctAnswer;

- (NSString *)generateMathQuestion;

- (NSString *)playersTurn;

-(void)check;

-(BOOL)gameIsOver;

@end
