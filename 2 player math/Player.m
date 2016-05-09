//
//  Player.m
//  2 player math
//
//  Created by Anton Moiseev on 2016-05-09.
//  Copyright © 2016 Anton Moiseev. All rights reserved.
//

#import "Player.h"

@implementation Player

- (instancetype) init {
    
    self = [super init];
    
    if (self) {
        
        _lives = 3;
        _turns = 0;
        _answer = [[NSMutableString alloc] init];
        
    }
    return self;
}

- (void)loseALife {
    
    self.lives -= 1;
    
}

@end
