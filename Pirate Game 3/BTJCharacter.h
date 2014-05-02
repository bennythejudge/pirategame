//
//  BTJCharacter.h
//  Pirate Game 3
//
//  Created by neo on 26/04/2014.
//  Copyright (c) 2014 BennyTheJudge. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BTJWeapon.h"
#import "BTJArmor.h"

@interface BTJCharacter : NSObject

@property (strong,nonatomic) BTJArmor *armor;
@property (strong,nonatomic) BTJWeapon *weapon;
@property (nonatomic) int health;
@property (nonatomic) int damage;

@end
