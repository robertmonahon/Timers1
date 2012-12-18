//
//  ViewController.m
//  Timers1
//
//  Created by Robert Monahon on 12/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "objectiveTimer.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize endButtonUpdate;
@synthesize startButtonUpdate;
@synthesize dragonBar;
@synthesize baronBar;
@synthesize baronTimer;
@synthesize baronButtonUpdate;
@synthesize dragonTimer;
@synthesize dragonButtonUpdate;
@synthesize trTimer;
@synthesize trButtonUpdate;
@synthesize tbTimer;
@synthesize tbButtonUpdate;
@synthesize orTimer;
@synthesize orButtonUpdate;
@synthesize obTimer;
@synthesize obButtonUpdate;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [startButtonUpdate setTitle:@"Start Game (1:00)" forState:UIControlStateNormal];
    [startButtonUpdate setTitle:@"Game has begun!" forState:UIControlStateDisabled];
    
}

- (void)viewDidUnload
{
    [self setObTimer:nil];
    [self setOrTimer:nil];
    [self setTbTimer:nil];
    [self setTbTimer:nil];
    [self setTrTimer:nil];
    [self setDragonTimer:nil];
    [self setBaronTimer:nil];
    [self setStartButtonUpdate:nil];
    [self setObButtonUpdate:nil];
    [self setOrButtonUpdate:nil];
    [self setTbButtonUpdate:nil];
    [self setTrButtonUpdate:nil];
    [self setDragonButtonUpdate:nil];
    [self setBaronButtonUpdate:nil];
    [self setEndButtonUpdate:nil];
    [self setDragonBar:nil];
    [self setBaronBar:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)startGame:(id)sender {
    
    ourBlue = [[objectiveTimer alloc] initWithName:@"Our Blue"];
    ourRed = [[objectiveTimer alloc] initWithName:@"Our Red"];
    theirBlue = [[objectiveTimer alloc] initWithName:@"Their Blue"];
    theirRed = [[objectiveTimer alloc] initWithName:@"Their Red"];
    dragon = [[objectiveTimer alloc] initWithName:@"Dragon"];
    baron = [[objectiveTimer alloc] initWithName:@"Baron"];
    
    globalClock = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(clockTick) userInfo:nil repeats:YES];
    [globalClock fire];
    
    startButtonUpdate.enabled = false;
    
}

// [RLM] [NOTE]
// move the timers into an array
// figure out how to put the values into the string in one line - mutable vs. immutable

- (void)clockTick
{
    [ourBlue tick];
    [ourRed tick];
    [theirBlue tick];
    [theirRed tick];
    [dragon tick];
    [baron tick];
    
    obTimer.text = ourBlue.status;
    orTimer.text = ourRed.status;
    tbTimer.text = theirBlue.status;
    trTimer.text = theirRed.status;
    dragonTimer.text = dragon.status;
    baronTimer.text = baron.status;
    
    dragonBar.progress = ((float)dragon.afterKillRespawnTimer-(float)dragon.respawnTimer)/(float)dragon.afterKillRespawnTimer;
    if(dragonBar.progress > 0.75) {
        dragonBar.progressTintColor = [UIColor redColor];
    } else {
        dragonBar.progressTintColor = [UIColor blueColor];
    }
    
    baronBar.progress = ((float)baron.afterKillRespawnTimer-(float)baron.respawnTimer)/(float)baron.afterKillRespawnTimer;
    if(baronBar.progress > 0.8) {
        baronBar.progressTintColor = [UIColor redColor];
    } else {
        baronBar.progressTintColor = [UIColor blueColor];
    }
    
}

- (IBAction)obStart:(id)sender {
    
    [ourBlue kill];
    
}
- (IBAction)orStart:(id)sender {
    
    [ourRed kill];
    
}
- (IBAction)tbStart:(id)sender {
    
    [theirBlue kill];
    
}
- (IBAction)trStart:(id)sender {
    
    [theirRed kill];
    
}
- (IBAction)dragonStart:(id)sender {
    
    [dragon kill];
    
}
- (IBAction)baronStart:(id)sender {
    
    [baron kill];
    
}
- (IBAction)endGame:(id)sender {
    
    startButtonUpdate.enabled = true;
    /*obButtonUpdate.enabled = false;
    orButtonUpdate.enabled = false;
    tbButtonUpdate.enabled = false;
    trButtonUpdate.enabled = false;
    dragonButtonUpdate.enabled = false;
    baronButtonUpdate.enabled = false;
    endButtonUpdate.enabled = false;*/
    
    obTimer.text = @"Spawn at 1:55";
    orTimer.text = @"Spawn at 1:55";
    tbTimer.text = @"Spawn at 1:55";
    trTimer.text = @"Spawn at 1:55";
    dragonTimer.text = @"Spawn at 6:00";
    baronTimer.text = @"Spawn at 15:00";
    
    [globalClock invalidate];
    
}
@end
