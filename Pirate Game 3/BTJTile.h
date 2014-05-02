//
//  BTJTile.h
//  Pirate Game 3
//
//  Created by neo on 22/04/2014.
//  Copyright (c) 2014 BennyTheJudge. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BTJWeapon.h"
#import "BTJArmor.h"

@interface BTJTile : NSObject

// the property of a tile
@property (strong,nonatomic) NSString *story;
@property (strong,nonatomic) UIImage *background;
@property (strong,nonatomic) NSString *actionButtonName;    
@property (nonatomic) CGPoint location;
@property (strong,nonatomic) BTJWeapon *weapon;
@property (strong,nonatomic) BTJArmor *armor;
@property (nonatomic) int healthEffect;

@end
