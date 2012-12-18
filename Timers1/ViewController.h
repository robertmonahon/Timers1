//
//  ViewController.h
//  Timers1
//
//  Created by Robert Monahon on 12/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "objectiveTimer.h"

@interface ViewController : UIViewController
{
    NSTimer *globalClock;
    objectiveTimer *ourBlue;
    objectiveTimer *ourRed;
    objectiveTimer *theirBlue;
    objectiveTimer *theirRed;
    objectiveTimer *dragon;
    objectiveTimer *baron;
}

- (IBAction)startGame:(id)sender;

- (IBAction)obStart:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *obTimer;
@property (weak, nonatomic) IBOutlet UIButton *obButtonUpdate;

- (IBAction)orStart:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *orTimer;
@property (weak, nonatomic) IBOutlet UIButton *orButtonUpdate;

- (IBAction)tbStart:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *tbTimer;
@property (weak, nonatomic) IBOutlet UIButton *tbButtonUpdate;

- (IBAction)trStart:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *trTimer;
@property (weak, nonatomic) IBOutlet UIButton *trButtonUpdate;

- (IBAction)dragonStart:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *dragonTimer;
@property (weak, nonatomic) IBOutlet UIButton *dragonButtonUpdate;

- (IBAction)baronStart:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *baronTimer;
@property (weak, nonatomic) IBOutlet UIButton *baronButtonUpdate;

- (IBAction)endGame:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *endButtonUpdate;

@property (weak, nonatomic) IBOutlet UIButton *startButtonUpdate;
@property (weak, nonatomic) IBOutlet UIProgressView *dragonBar;
@property (weak, nonatomic) IBOutlet UIProgressView *baronBar;

- (void)clockTick;



@end
