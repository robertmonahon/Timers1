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
{
    NSTimer *globalClock;
    NSMutableArray *_objects;
    NSMutableArray *_timerLabels;
    NSMutableArray *_timerBars;
    int timerCount;
    objectiveTimer *ourBlue;
    objectiveTimer *ourRed;
    objectiveTimer *theirBlue;
    objectiveTimer *theirRed;
    objectiveTimer *dragon;
    objectiveTimer *baron;
}

@end

@implementation ViewController
@synthesize endButtonUpdate;
@synthesize startButtonUpdate;
@synthesize obBar;
@synthesize tbBar;
@synthesize orBar;
@synthesize trBar;
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

    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
    
    ourBlue = [[objectiveTimer alloc] initWithName:@"Our Blue"];
    [_objects addObject:ourBlue];
    
    ourRed = [[objectiveTimer alloc] initWithName:@"Our Red"];
    [_objects addObject:ourRed];
    
    theirBlue = [[objectiveTimer alloc] initWithName:@"Their Blue"];
    [_objects addObject:theirBlue];
    
    theirRed = [[objectiveTimer alloc] initWithName:@"Their Red"];
    [_objects addObject:theirRed];
    
    dragon = [[objectiveTimer alloc] initWithName:@"Dragon"];
    [_objects addObject:dragon];
    
    baron = [[objectiveTimer alloc] initWithName:@"Baron"];
    [_objects addObject:baron];
    
    _timerLabels = [NSMutableArray arrayWithObjects:obTimer, orTimer, tbTimer, trTimer, dragonTimer, baronTimer, nil];
    
    _timerBars = [NSMutableArray arrayWithObjects:obBar, orBar, tbBar, trBar, dragonBar, baronBar, nil];
    
    timerCount = 6;
	  	  	
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
    [self setObBar:nil];
    [self setTbBar:nil];
    [self setOrBar:nil];
    [self setTrBar:nil];
    [super viewDidUnload];
    
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)startGame:(id)sender {
    
    
    [globalClock invalidate];
    globalClock = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(clockTick) userInfo:nil repeats:YES];
    [globalClock fire];
    
    // this isn't disabling the button in the simulator
    startButtonUpdate.enabled = false;
    
}

// [RLM] [NOTE]
// move the timers into an array
// figure out how to put the values into the string in one line - mutable vs. immutable
// broadcast the clock tick and have the objective timers listen - possible?

- (void)clockTick
{
    for (objectiveTimer *timer in _objects) {
        [timer tick];
    }
    
    for (int i = 0; i < timerCount; i++) {
        [[_timerLabels objectAtIndex:i] setText:[[_objects objectAtIndex:i] getStatus]];
    }
    
    //dragonBar.progress = ((float)dragon.afterKillRespawnTimer-(float)dragon.respawnTimer)/(float)dragon.afterKillRespawnTimer;
    //if(dragonBar.progress > 0.75) {
    //    dragonBar.progressTintColor = [UIColor redColor];
    //} else {
    //    dragonBar.progressTintColor = [UIColor blueColor];
    //}
    
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
    obBar.progress = 0;
    tbBar.progress = 0;
    orBar.progress = 0;
    trBar.progress = 0;
    dragonBar.progress = 0;
    baronBar.progress = 0;
    
    [globalClock invalidate];
    
}

- (void)progressHelper:(UIProgressView *)bar withTimer:(objectiveTimer *)timer {
    
    [bar setProgress:((float)[timer getResetTimer]-(float)[timer getCurrentTimer])/(float)[timer getResetTimer]];
    
    if([bar progress] > 0.8) {
        [bar setProgressTintColor:[UIColor redColor]];
    } else {
        [bar setProgressTintColor:[UIColor blueColor]];
    }
}

@end
