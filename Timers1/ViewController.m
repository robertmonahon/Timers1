//
//  ViewController.m
//  Timers1
//
//  Created by Robert Monahon on 12/16/12.
//  Update by Cyrus Dukart on 06/03/13
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
    
    obTimer.text = @"1:55";
    orTimer.text = @"1:55";
    tbTimer.text = @"1:55";
    trTimer.text = @"1:55";
    dragonTimer.text = @"6:00";
    baronTimer.text = @"15:00";
    obBar.progress = 0;
    tbBar.progress = 0;
    orBar.progress = 0;
    trBar.progress = 0;
    dragonBar.progress = 0;
    baronBar.progress = 0;
    
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
    [self setObBorder:nil];
    [self setTbBorder:nil];
    [self setOrBorder:nil];
    [self setTrBorder:nil];
    [self setDragonBorder:nil];
    [self setBaronBorder:nil];
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
    
    for (int i = 0; i < timerCount; i++) {
        [self progressHelper:[_timerBars objectAtIndex:i] withTimer:[_objects objectAtIndex:i]];
    }
    
}

- (IBAction)obStart:(id)sender {    
    [ourBlue kill];
}

- (IBAction)obTick:(id)sender {
    if([ourBlue getAlive]) {   //First Check if is Alive
        [ourBlue kill];        //If So Kill It on Click
    } else {
        [ourBlue tick];      //Else UnTick
        [obTimer setText:[ourBlue getStatus]];  //Quick Refresh of Number
    }
}

- (IBAction)obUnTick:(id)sender {
    if([ourBlue getAlive]) {   //First Check if is Alive
        [ourBlue kill];        //If So Kill It on Click
    } else {
        [ourBlue untick];      //Else UnTick
        [obTimer setText:[ourBlue getStatus]];  //Quick Refresh of Number
    }
}
- (IBAction)orStart:(id)sender {
    
    [ourRed kill];
    
}

- (IBAction)orTick:(id)sender {
    if([ourRed getAlive]) {   //First Check if is Alive
        [ourRed kill];        //If So Kill It on Click
    } else {
        [ourRed tick];      //Else UnTick
        [orTimer setText:[ourRed getStatus]];  //Quick Refresh of Number
    }
}

- (IBAction)orUnTick:(id)sender {
    if([ourRed getAlive]) {   //First Check if is Alive
        [ourRed kill];        //If So Kill It on Click
    } else {
        [ourRed untick];      //Else UnTick
        [orTimer setText:[ourRed getStatus]];  //Quick Refresh of Number
    }
}

- (IBAction)tbStart:(id)sender {
    [theirBlue kill];
}

- (IBAction)tbTick:(id)sender {
    if([theirBlue getAlive]) {   //First Check if is Alive
        [theirBlue kill];        //If So Kill It on Click
    } else {
        [theirBlue tick];      //Else UnTick
        [tbTimer setText:[theirBlue getStatus]];  //Quick Refresh of Number
    }
}

- (IBAction)tbUnTick:(id)sender {
    if([theirBlue getAlive]) {   //First Check if is Alive
        [theirBlue kill];        //If So Kill It on Click
    } else {
        [theirBlue untick];      //Else UnTick
        [tbTimer setText:[theirBlue getStatus]];  //Quick Refresh of Number
    }
}

- (IBAction)trStart:(id)sender {
    [theirRed kill];
}

- (IBAction)trTick:(id)sender {
    if([theirRed getAlive]) {   //First Check if is Alive
        [theirRed kill];        //If So Kill It on Click
    } else {
        [theirRed tick];      //Else UnTick
        [trTimer setText:[theirRed getStatus]];  //Quick Refresh of Number
    }
}

- (IBAction)trUnTick:(id)sender {
    if([theirRed getAlive]) {   //First Check if is Alive
        [theirRed kill];        //If So Kill It on Click
    } else {
        [theirRed untick];      //Else UnTick
        [trTimer setText:[theirRed getStatus]];  //Quick Refresh of Number
    }
}

- (IBAction)dragonStart:(id)sender {
    [dragon kill];
}

- (IBAction)dragonTick:(id)sender {
    if([dragon getAlive]) {   //First Check if is Alive
        [dragon kill];        //If So Kill It on Click
    } else {
        [dragon tick];      //Else UnTick
        [dragonTimer setText:[dragon getStatus]];  //Quick Refresh of Number
    }
}

- (IBAction)dragonUnTick:(id)sender {
    if([dragon getAlive]) {   //First Check if is Alive
        [dragon kill];        //If So Kill It on Click
    } else {
        [dragon untick];      //Else UnTick
        [dragonTimer setText:[dragon getStatus]];  //Quick Refresh of Number
    }
}

- (IBAction)baronStart:(id)sender {
    [baron kill];
}

- (IBAction)baronUnTick:(id)sender {
    if([baron getAlive]) {   //First Check if is Alive
        [baron kill];        //If So Kill It on Click
    } else {
        [baron untick];      //Else UnTick
        [baronTimer setText:[baron getStatus]];  //Quick Refresh of Number
    }
}

- (IBAction)baronTick:(id)sender {
    if([baron getAlive]) {   //First Check if is Alive
        [baron kill];        //If So Kill It on Click
    } else {
        [baron tick];      //Else UnTick
        [baronTimer setText:[baron getStatus]];  //Quick Refresh of Number
    }
}

- (IBAction)endGame:(id)sender {
    
    startButtonUpdate.enabled = true;
    obButtonUpdate.enabled = false;
    orButtonUpdate.enabled = false;
    tbButtonUpdate.enabled = false;
    trButtonUpdate.enabled = false;
    dragonButtonUpdate.enabled = false;
    baronButtonUpdate.enabled = false;
    endButtonUpdate.enabled = false;
    
    obTimer.text = @"1:55";
    orTimer.text = @"1:55";
    tbTimer.text = @"1:55";
    trTimer.text = @"1:55";
    dragonTimer.text = @"6:00";
    baronTimer.text = @"15:00";
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
    
    if((float)[timer getCurrentTimer] <= 10) {
        [bar setProgressTintColor:[UIColor redColor]];
    } else {
        [bar setProgressTintColor:[UIColor darkGrayColor]];
    }
}

@end
