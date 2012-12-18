//
//  objectiveTimer.m
//  Timers1
//
//  Created by Robert Monahon on 12/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "objectiveTimer.h"

@implementation objectiveTimer

@synthesize respawnTimer, alive, name, status, afterKillRespawnTimer;

- (id)initWithName:(NSString *)objectiveName
{
    self = [super init];
    if(self) {
        self->name = objectiveName;
        self->alive = false;
        if(objectiveName == @"Our Blue" || objectiveName == @"Our Red" || objectiveName == @"Their Blue" || objectiveName == @"Their Red"){
            self->respawnTimer = 5;
            self->afterKillRespawnTimer = 15;
        } else if (objectiveName == @"Dragon") {
            self->respawnTimer = 10;
            self->afterKillRespawnTimer = 20;
        } else if (objectiveName == @"Baron") {
            self->respawnTimer = 20;
            self->afterKillRespawnTimer = 25;
        } else {
            self->respawnTimer = 0;
            self->afterKillRespawnTimer = 0;
        }
        NSString *temp = [NSString stringWithFormat:@"Spawns at %i:%i",((self->respawnTimer+60)/60),self->respawnTimer%60];
        self->status = temp;

    }
    return self;
    
}

- (void)tick
{
    NSString *val = status;
    if(!self->alive){
        if(self->respawnTimer < 1){
            self->alive = true;
            val = @"ALIVE!";
        } else {
            self->respawnTimer--;
            val = [NSString stringWithFormat:@"%i:%i",self.respawnTimer/60,self.respawnTimer%60];
        }
    }
    self->status = val;
}

- (void)kill
{
    if(self->alive) {
        self->alive = false;
        self->respawnTimer = self->afterKillRespawnTimer;
    }
}

@end
