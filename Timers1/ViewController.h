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

- (IBAction)startGame:(id)sender;

- (IBAction)obStart:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *obTimer;
@property (weak, nonatomic) IBOutlet UIButton *obButtonUpdate;
@property (weak, nonatomic) IBOutlet UIProgressView *obBar;

- (IBAction)tbStart:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *tbTimer;
@property (weak, nonatomic) IBOutlet UIButton *tbButtonUpdate;
@property (weak, nonatomic) IBOutlet UIProgressView *tbBar;

- (IBAction)orStart:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *orTimer;
@property (weak, nonatomic) IBOutlet UIButton *orButtonUpdate;
@property (weak, nonatomic) IBOutlet UIProgressView *orBar;

- (IBAction)trStart:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *trTimer;
@property (weak, nonatomic) IBOutlet UIButton *trButtonUpdate;
@property (weak, nonatomic) IBOutlet UIProgressView *trBar;

- (IBAction)dragonStart:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *dragonTimer;
@property (weak, nonatomic) IBOutlet UIButton *dragonButtonUpdate;
@property (weak, nonatomic) IBOutlet UIProgressView *dragonBar;

- (IBAction)baronStart:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *baronTimer;
@property (weak, nonatomic) IBOutlet UIButton *baronButtonUpdate;
@property (weak, nonatomic) IBOutlet UIProgressView *baronBar;

- (IBAction)endGame:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *endButtonUpdate;
@property (weak, nonatomic) IBOutlet UIButton *startButtonUpdate;



- (void)clockTick;



@end
