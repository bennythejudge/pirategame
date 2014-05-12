//
//  BTJFactory.h
//  Pirate Game 3
//
//  Created by neo on 22/04/2014.
//  Copyright (c) 2014 BennyTheJudge. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BTJCharacter.h"
#import "BTJBoss.h"

@interface BTJFactory : NSObject

-(NSArray *) tiles;
-(BTJCharacter *) character;
-(BTJBoss *) boss;

@end
