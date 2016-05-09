//
//  Player.h
//  2 player math
//
//  Created by Anton Moiseev on 2016-05-09.
//  Copyright © 2016 Anton Moiseev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

@property int lives;

@property int turns;

@property NSMutableString *answer;

- (void)loseALife;

@end
