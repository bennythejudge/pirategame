//
//  BTJViewController.m
//  Pirate Game 3
//
//  Created by neo on 21/04/2014.
//  Copyright (c) 2014 BennyTheJudge. All rights reserved.
//

#import "BTJViewController.h"
#import "BTJTile.h"
#import "BTJFactory.h"


@interface BTJViewController ()

@end

@implementation BTJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    // create factory and generate tiles
    BTJFactory *factory = [[BTJFactory alloc] init];
    
    // get a boss!
    self.boss = [ factory boss];
    
    
    // create character
    self.character = [factory character];
    NSLog(@"character health: %i", self.character.health);
    
    //NSArray *arrayOfTiles = [factory tiles];
    self.arrayOfTiles = [factory tiles];
    // check the content of arrayOfTiles
    NSLog(@"%@",self.arrayOfTiles);
    NSLog(@"elements in arrayOfTiles %i",[self.arrayOfTiles count]);
    for (NSUInteger i=0; i<[self.arrayOfTiles count]; i++) {
        for (int x=0; x< [[self.arrayOfTiles objectAtIndex:i] count]; x++ ) {
            BTJTile *a = [[BTJTile alloc] init];
            a=[[self.arrayOfTiles objectAtIndex:i] objectAtIndex:x];
            NSLog(@"%i: %f %f",i, a.location.x, a.location.y);
        }
    }
    // we start from location 0,0 in the grid
    self.currentCol = 0;
    self.currentRow = 0;
    self.currentPoint = CGPointMake(self.currentRow, self.currentCol);
    // first time - hid the west and south buttons
    _westButton.hidden = YES;
    _southButton.hidden = YES;
    _storyText.text = @"Just started!";
    
    //
    NSString *s = [NSString stringWithFormat:@"start %i %i", self.currentRow, self.currentCol];
    self.infoLabel.text = s;
    
    //update the character stuff
    self.healthValue.text = [NSString stringWithFormat:@"%i", self.character.health];
    self.armorName.text = self.character.armor.name;
    self.weaponeName.text = self.character.weapon.name;
    self.damageValue.text = [NSString stringWithFormat:@"%i", self.character.damage];
    [self updateCharacterStatsForArmor:nil withWeapons:nil withHealthEffects:0];

    [self updateTile];

    // initialise character
    /* 
     BTJCharacter *me = [[BTJCharacter alloc] init];
    me.health = 10;
    me.armor  = 0;
    NSString *sHealth = [NSString stringWithFormat:@"%i", me.health];
    self.healthValue.text = sHealth;
     */
}

// creating a helper method - doesn't need to be declared
// in the .h file because it won't be used elsewhere
-(void) updateTile
{
    // update the character stuff
    self.healthValue.text = [NSString stringWithFormat:@"%i", self.character.health];
    self.armorName.text = self.character.armor.name;
    self.weaponeName.text = self.character.weapon.name;
    self.damageValue.text = [NSString stringWithFormat:@"%i", self.character.damage];
   
    NSLog(@"row: %i col: %i health: %i armor: %@ weapon: %@",self.currentRow,self.currentCol,self.character.health, self.character.armor.name, self.character.weapon.name);
    BTJTile *tileModel = [[self.arrayOfTiles objectAtIndex:self.currentRow]objectAtIndex:self.currentCol];
    // here we have the tile with all of its content:
    NSLog(@"tile armor health: %i", tileModel.armor.health);
    NSLog(@"tile armor name: %@", tileModel.armor.name);
    NSLog(@"tile weapon name: %@", tileModel.weapon.name);
    NSLog(@"tile armor damage: %i", tileModel.weapon.damage);
    //self.character.health = self.character.health + tileModel.armor.health;
    //self.character.damage = self.character.damage + tileModel.weapon.damage;
    
    self.storyText.text = tileModel.story;
    self.backgroundImage.image = tileModel.background;
    // update the action button from the tile array
    [self.actionButton setTitle:tileModel.actionButtonName forState:UIControlStateNormal];
}

-(void) updateCharacterStatsForArmor:(BTJArmor *) armor withWeapons:(BTJWeapon *) weapon withHealthEffects:(int)healthEffect
{
    if (armor != nil) {
        self.character.health = self.character.health - self.character.armor.health + armor.health;
        self.character.armor.name = armor.name;
    } else if (weapon != nil) {
        self.character.damage = self.character.damage - self.character.weapon.damage + weapon.damage;
        self.character.weapon.name = weapon.name;
    } else if (healthEffect != 0) {
        self.character.health = self.character.health + healthEffect;
    } else {
        // initial values
        self.character.health = self.character.health + self.character.armor.health;
        self.character.damage = self.character.damage + self.character.weapon.damage;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)northButtonPressed:(UIButton *)sender
{
    self.currentRow = self.currentPoint.x;
    self.currentCol = self.currentPoint.y;

    if (self.currentRow >= 0 && self.currentRow < 3 ) {
        self.currentRow++;
        self.currentPoint = CGPointMake(self.currentRow,self.currentCol);
        self.northButton.hidden = NO;
        NSString *s = [NSString stringWithFormat:@"%i %i", self.currentRow, self.currentCol];
        self.infoLabel.text = s;
        NSLog(@"row: %i col: %i",self.currentRow,self.currentCol);
        [self updateTile];
    }
    if ( self.currentRow == 3) {
        self.northButton.hidden = YES;
    }
    // reset South button
    if ( self.currentRow > 0 && self.currentRow <= 3) {
        self.southButton.hidden = NO;
    }
}

- (IBAction)eastButtonPressed:(UIButton *)sender
{
    self.currentRow = self.currentPoint.x;
    self.currentCol = self.currentPoint.y;
    
    if (self.currentCol < 2 && self.currentCol >= 0) {
        self.currentCol++;
        self.currentPoint = CGPointMake(self.currentRow,self.currentCol);
        self.eatButton.hidden = NO;
        NSString *s = [NSString stringWithFormat:@"%i %i", self.currentRow, self.currentCol];
        self.infoLabel.text = s;
        [self updateTile];
    }
    if ( self.currentCol == 2) {
        self.eatButton.hidden = YES;
    }
    // reset west button
    if ( self.currentCol > 0 && self.currentCol <= 2) {
        self.westButton.hidden = NO;
    }
}

- (IBAction)westButtonPressed:(UIButton *)sender
{
    self.currentRow = self.currentPoint.x;
    self.currentCol = self.currentPoint.y;
    
    if (self.currentCol > 0 && self.currentCol < 3 ) {
        self.currentCol--;
        self.currentPoint = CGPointMake(self.currentRow,self.currentCol);
        _westButton.hidden = NO;
        NSString *s = [NSString stringWithFormat:@"%i %i", self.currentRow, self.currentCol];
        self.infoLabel.text = s;
        [self updateTile];
    }
    if ( self.currentCol == 0) {
        _westButton.hidden = YES;
    }
    // reset east button
    if ( self.currentCol >= 0 && self.currentCol < 2) {
        _eatButton.hidden = NO;
    }

}

- (IBAction)southButtonPressed:(UIButton *)sender
{
    self.currentRow = self.currentPoint.x;
    self.currentCol = self.currentPoint.y;
    
    if (self.currentRow > 0 && self.currentRow <= 3 ) {
        self.currentRow--;
        self.currentPoint = CGPointMake(self.currentRow,self.currentCol);
        self.southButton.hidden = NO;
        NSString *s = [NSString stringWithFormat:@"%i %i", self.currentRow, self.currentCol];
        self.infoLabel.text = s;
        NSLog(@"row: %i col: %i",self.currentRow,self.currentCol);
        [self updateTile];
    }
    if ( self.currentRow == 0) {
        self.southButton.hidden = YES;
    }
    // reset North button
    if ( self.currentRow >= 0 && self.currentRow < 3) {
        self.northButton.hidden = NO;
    }
}

- (IBAction)actionButtonPressed:(UIButton *)sender {
    if ( self.currentRow == 3 && self.currentCol == 2) {
        NSLog(@"ci siamo: siamo al BOSS!");
    }
    
    NSString *s = [NSString stringWithFormat:@"action: %i %i", self.currentRow, self.currentCol];

    // 1: what's the current tile:
    BTJTile *tile = [[self.arrayOfTiles objectAtIndex:self.currentRow] objectAtIndex:self.currentCol];

    NSLog(@"inside actionButtonPressed %@ %@ ",tile.armor, tile.weapon );

    
    // are we fighting the boss?
    if (tile.healthEffect == -15 )
    {
        NSLog(@"fighting the BOSS!");
        self.boss.health = self.boss.health - self.character.damage;
    }
        

    
    [self updateCharacterStatsForArmor:tile.armor withWeapons:tile.weapon withHealthEffects:tile.healthEffect];
    
    [self updateTile];
    

    self.infoLabel.text = s;
    
    _actionButton.highlighted = YES;
}

// helper methods
/*
- (BOOL)tileExistsAtPoint:(CGPoint)point
{
    if(point.y >= 0 && point.x >= 0 &&
       point.x < [self.tiles count] &&
       point.y < [[self.tiles objectAtIndex:point.x] count])
    {
        return NO;
    }
    else {
        return YES;
    }
    
}

-(void)updateButtons
{
    self.westButton.hidden = [self tileExistsAtPoint:CGPointMake(self.currentPoint.x - 1, self.currentPoint.y)];
    self.eatButton.hidden = [self tileExistsAtPoint:CGPointMake(self.currentPoint.x + 1, self.currentPoint.y)];
    self.northButton.hidden = [self tileExistsAtPoint:CGPointMake(self.currentPoint.x, self.currentPoint.y + 1)];
    self.southButton.hidden = [self tileExistsAtPoint:CGPointMake(self.currentPoint.x, self.currentPoint.y - 1)];
}

*/

@end
