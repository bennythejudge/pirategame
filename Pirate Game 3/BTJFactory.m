//
//  BTJFactory.m
//  Pirate Game 3
//
//  Created by neo on 22/04/2014.
//  Copyright (c) 2014 BennyTheJudge. All rights reserved.
//

#import "BTJFactory.h"
#import "BTJTile.h"


@implementation BTJFactory
int const ROWS=3;
int const COLUMNS=4;

-(NSArray *) tiles
{
    
    BTJTile *tile1 = [[BTJTile alloc] init];
    tile1.story = @"story 0,0";
    tile1.background = [[UIImage alloc] initWithContentsOfFile:@"PiratePlank.jpg"];
    tile1.location = CGPointMake (0,0);
    tile1.story = @"1 Captain, we need a fearless leader such as you to undertake a voyage. You must stop the evil pirate Boss before he steals any more plunder. Would you like a blunted sword to get \nstarted?";
    tile1.background = [UIImage imageNamed:@"PirateStart.jpg"];
    tile1.actionButtonName = @"Get blunted sword";
    BTJWeapon *bluntedSword = [[BTJWeapon alloc]init];
    bluntedSword.damage = 12;
    bluntedSword.name = @"BS";
    tile1.weapon = bluntedSword;
    
    
    BTJTile *tile2 = [[BTJTile alloc] init];
    tile2.story = @"story 0,1";
    tile2.background = [[UIImage alloc] initWithContentsOfFile:@"PirateFriendlyDock.jpg"];
    tile2.location = CGPointMake (0,1);
    tile2.story = @"2 You have come across an armory. Would you like to upgrade your armor to steel armor?";
    tile2.background = [UIImage imageNamed:@"PirateBlacksmith.jpeg"];
    tile2.actionButtonName = @"Upgrade armor";
    BTJArmor *armor = [[BTJArmor alloc]init];
    armor.health = 8;
    armor.name = @"Steel Armor";
    tile2.armor = armor;

    
    BTJTile *tile3 = [[BTJTile alloc] init];
    tile3.story = @"story 0,2";
    tile3.background = [[UIImage alloc] initWithContentsOfFile:@"PirateWeapons.jpeg"];
    tile3.location = CGPointMake (0,2);
    tile3.story = @"3 A mysterious dock appears on the horizon. Should we stop and ask for directions?";
    tile3.background = [UIImage imageNamed:@"PirateFriendlyDock.jpg"];
    tile3.actionButtonName = @"Stop and ask for directions";
    tile3.healthEffect = 12;

    
    NSMutableArray *firstColumn = [[NSMutableArray alloc] init];
    [firstColumn addObject:tile1];
    [firstColumn addObject:tile2];
    [firstColumn addObject:tile3];
    
                                   
    BTJTile *tile4 = [[BTJTile alloc] init];
    tile4.story = @"story 1,0";
    tile4.location = CGPointMake (1,0);
    tile4.story = @"4 You have found a parrot can be used in your armor slot! Parrots are a great defender and are fiercly loyal to their captain.";
    tile4.background = [UIImage imageNamed:@"PirateParrot.jpg"];
    tile4.actionButtonName = @"Adopt parrot";
    BTJArmor *parrot = [[BTJArmor alloc]init];
    parrot.name = @"parrot";
    parrot.health = 10;
    tile4.armor = parrot;

    
    BTJTile *tile5 = [[BTJTile alloc] init];
    tile5.story = @"story 1,1";
    tile5.location = CGPointMake (1,1);
    tile5.story = @"5 You have stumbled upon a cache of pirate weapons. Would you like to upgrade to a pistol?";
    tile5.background = [UIImage imageNamed:@"PirateWeapons.jpeg"];
    tile5.actionButtonName = @"Upgrade to a pistol";
    BTJWeapon *pistol = [[BTJWeapon alloc]init];
    pistol.damage = 17;
    pistol.name = @"pistol";
    tile5.weapon = pistol;


    BTJTile *tile6 = [[BTJTile alloc] init];
    tile6.story = @"story 1,2";
    tile6.location = CGPointMake (1,2);
    tile6.story = @"6 You have been captured by pirates and are ordered to walk the plank";
    tile6.background = [UIImage imageNamed:@"PiratePlank.jpg"];
    tile6.actionButtonName = @"Walk the plank with defiance";

    
    NSMutableArray *secondColumn = [[NSMutableArray alloc] init];
    [secondColumn addObject:tile4];
    [secondColumn addObject:tile5];
    [secondColumn addObject:tile6];
    
    BTJTile *tile7 = [[BTJTile alloc] init];
    tile7.story = @"story 2,0";
    tile7.location = CGPointMake (2,0);
    tile7.story = @"7 You sight a pirate battle off the coast";
    tile7.background = [UIImage imageNamed:@"PirateShipBattle.jpeg"];
    tile7.actionButtonName = @"Take part to the battle";
    tile7.healthEffect = 8;
    
    BTJTile *tile8 = [[BTJTile alloc] init];
    tile8.story = @"story 2,1";
    tile8.location = CGPointMake (2,1);
    tile8.story = @"8 The legend of the deep, the mighty kraken appears";
    tile8.background = [UIImage imageNamed:@"PirateOctopusAttack.jpg"];
    tile8.actionButtonName = @"What?";
    tile8.healthEffect = -46;

    
    BTJTile *tile9 = [[BTJTile alloc] init];
    tile9.story = @"story 2,2";
    tile9.location = CGPointMake (2,2);
    tile9.story = @"9 You stumble upon a hidden cave of pirate treasurer";
    tile9.background = [UIImage imageNamed:@"PirateTreasure.jpeg"];
    tile9.actionButtonName = @"Collect treasure";
    tile9.healthEffect = 50;

    
    NSMutableArray *thirdColumn = [[NSMutableArray alloc] init];
    [thirdColumn addObject:tile7];
    [thirdColumn addObject:tile8];
    [thirdColumn addObject:tile9];

    BTJTile *tile10 = [[BTJTile alloc] init];
    tile10.story = @"story 3,0";
    tile10.location = CGPointMake (3,0);
    tile10.story = @"10 A group of pirates attempts to board your ship";
    tile10.background = [UIImage imageNamed:@"PirateAttack.jpg"];
    tile10.actionButtonName = @"Welcome them and make tea!";
    tile10.healthEffect = -15;

    
    BTJTile *tile11 = [[BTJTile alloc] init];
    tile11.story = @"story 3,1";
    tile11.location = CGPointMake (3,1);
    tile11.story = @"11 In the deep of the sea many things live and many things can be found. Will the fortune bring help or ruin?";
    tile11.background = [UIImage imageNamed:@"PirateTreasurer2.jpeg"];
    tile11.actionButtonName = @"Ruin, no doubt!";
    tile11.healthEffect = -5;


    BTJTile *tile12 = [[BTJTile alloc] init];
    tile12.story = @"story 3,2";
    tile12.location = CGPointMake (3,2);
    tile12.story = @"12 Your final faceoff with the fearsome pirate boss";
    tile12.background = [UIImage imageNamed:@"PirateBoss.jpeg"];
    tile12.actionButtonName = @"Oh No!";
    tile12.healthEffect = -15;
    // setup the fight
    
    
    NSMutableArray *fourthColumn = [[NSMutableArray alloc] init];
    [fourthColumn addObject:tile10];
    [fourthColumn addObject:tile11];
    [fourthColumn addObject:tile12];
    
    NSArray *tiles = [[NSArray alloc] initWithObjects:firstColumn,secondColumn, thirdColumn, fourthColumn, nil];
    return tiles;
}

-(BTJCharacter *) character
{
    BTJCharacter *character = [[BTJCharacter alloc] init];
    character.health = 100;
    BTJArmor *armor = [[BTJArmor alloc] init];
    armor.name = @"Cloack";
    armor.health = 5;
    
    character.armor = armor;
    
    BTJWeapon *weapon = [[BTJWeapon alloc] init];
    weapon.name = @"Fists";
    weapon.damage = 5;
    
    character.weapon = weapon;
    
    return character;
}

@end
