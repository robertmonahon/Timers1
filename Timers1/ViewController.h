//
//  ViewController.h
//  Timers1
//
//  Created by Robert Monahon on 12/16/12.
//  Update by Cyrus Dukart on 06/03/13
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "objectiveTimer.h"

@interface ViewController : UIViewController

- (IBAction)startGame:(id)sender;

- (IBAction)obStart:(id)sender;
- (IBAction)obTick:(id)sender;
- (IBAction)obUnTick:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *obTimer;
@property (weak, nonatomic) IBOutlet UIButton *obButtonUpdate;
@property (weak, nonatomic) IBOutlet UIProgressView *obBar;
@property (weak, nonatomic) IBOutlet UIButton *obBorder;

- (IBAction)tbStart:(id)sender;
- (IBAction)tbTick:(id)sender;
- (IBAction)tbUnTick:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *tbTimer;
@property (weak, nonatomic) IBOutlet UIButton *tbButtonUpdate;
@property (weak, nonatomic) IBOutlet UIProgressView *tbBar;
@property (weak, nonatomic) IBOutlet UIButton *tbBorder;

- (IBAction)orStart:(id)sender;
- (IBAction)orTick:(id)sender;
- (IBAction)orUnTick:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *orTimer;
@property (weak, nonatomic) IBOutlet UIButton *orButtonUpdate;
@property (weak, nonatomic) IBOutlet UIProgressView *orBar;
@property (weak, nonatomic) IBOutlet UIButton *orBorder;

- (IBAction)trStart:(id)sender;
- (IBAction)trTick:(id)sender;
- (IBAction)trUnTick:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *trTimer;
@property (weak, nonatomic) IBOutlet UIButton *trButtonUpdate;
@property (weak, nonatomic) IBOutlet UIProgressView *trBar;
@property (weak, nonatomic) IBOutlet UIButton *trBorder;

- (IBAction)dragonStart:(id)sender;
- (IBAction)dragonTick:(id)sender;
- (IBAction)dragonUnTick:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *dragonTimer;
@property (weak, nonatomic) IBOutlet UIButton *dragonButtonUpdate;
@property (weak, nonatomic) IBOutlet UIProgressView *dragonBar;
@property (weak, nonatomic) IBOutlet UIButton *dragonBorder;

- (IBAction)baronStart:(id)sender;
- (IBAction)baronUnTick:(id)sender;
- (IBAction)baronTick:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *baronTimer;
@property (weak, nonatomic) IBOutlet UIButton *baronButtonUpdate;
@property (weak, nonatomic) IBOutlet UIProgressView *baronBar;
@property (weak, nonatomic) IBOutlet UIButton *baronBorder;

- (IBAction)endGame:(id)sender;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *endButtonUpdate;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *startButtonUpdate;

- (void)clockTick;
- (void)progressHelper:(UIProgressView *)bar withTimer:(objectiveTimer *)timer;



@end
