//
//  BTJViewController.h
//  Pirate Game 3
//
//  Created by neo on 21/04/2014.
//  Copyright (c) 2014 BennyTheJudge. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BTJCharacter.h"
#import "BTJBoss.h"

@interface BTJViewController : UIViewController

// instance variables

@property (strong,nonatomic) BTJBoss *boss;

@property (strong,nonatomic) BTJCharacter *character;

// keep track of current position in the grid
@property (nonatomic) int currentRow;
@property (nonatomic) int currentCol;
@property (nonatomic) CGPoint currentPoint;
@property (strong,nonatomic) NSArray *arrayOfTiles;


// the background image property
@property (strong, nonatomic) IBOutlet UIImageView *backgroundImage;

// the character properties labels
@property (strong, nonatomic) IBOutlet UILabel *healthValue;
@property (strong, nonatomic) IBOutlet UILabel *armorName;
@property (strong, nonatomic) IBOutlet UILabel *weaponeName;
@property (strong, nonatomic) IBOutlet UILabel *damageValue;
@property (strong, nonatomic) IBOutlet UILabel *storyText;
@property (strong, nonatomic) IBOutlet UILabel *infoLabel;

// buttons outlets
@property (strong, nonatomic) IBOutlet UIButton *northButton;
@property (strong, nonatomic) IBOutlet UIButton *eatButton;
@property (strong, nonatomic) IBOutlet UIButton *westButton;
@property (strong, nonatomic) IBOutlet UIButton *southButton;
@property (strong, nonatomic) IBOutlet UIButton *actionButton;

// buttons actions
- (IBAction)northButtonPressed:(UIButton *)sender;
- (IBAction)eastButtonPressed:(UIButton *)sender;
- (IBAction)westButtonPressed:(UIButton *)sender;
- (IBAction)southButtonPressed:(UIButton *)sender;
- (IBAction)actionButtonPressed:(UIButton *)sender;

@end
