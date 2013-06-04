//
//  objectiveTimer.m
//  Timers1
//
//  Created by Robert Monahon on 12/17/12.
//  Update by Cyrus Dukart on 06/03/13
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "objectiveTimer.h"

@implementation objectiveTimer

- (id)initWithName:(NSString *)objectiveName
{
    self = [super init];
    if(self) {
        self->name = objectiveName;
        self->alive = false;
        if(objectiveName == @"Our Blue" || objectiveName == @"Our Red" || objectiveName == @"Their Blue" || objectiveName == @"Their Red"){
            self->respawnTimer = 55;
            self->afterKillRespawnTimer = 300;
        } else if (objectiveName == @"Dragon") {
            self->respawnTimer = 300;
            self->afterKillRespawnTimer = 360;
        } else if (objectiveName == @"Baron") {
            self->respawnTimer = 20;//840;
            self->afterKillRespawnTimer = 25;//420;
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
    // new tick comment
    NSString *val = self->status;
    if(!self->alive){
        if(self->respawnTimer < 1){
            self->alive = true;
            val = @"ALIVE!";
        } else {
            self->respawnTimer--;
            val = [NSString stringWithFormat:@"%i:%i",[self getCurrentTimer]/60,[self getCurrentTimer]%60];
        }
    }
    self->status = val;
}

- (void)untick
{
    // new
    NSString *val = self->status;
    if(!self->alive){
        if(self->respawnTimer < 1){
            self->alive = true;
            val = @"ALIVE!";
        } else {
            self->respawnTimer++;
            val = [NSString stringWithFormat:@"%i:%i",[self getCurrentTimer]/60,[self getCurrentTimer]%60];
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

- (NSString *)getName{
    return self->name;
}

- (NSString *)getStatus{
    return self->status;
}

- (int)getCurrentTimer{
    return self->respawnTimer;
}

- (bool)getAlive{
    return self->alive;
}

- (int)getResetTimer{
    return self->afterKillRespawnTimer;
}

- (void)setName:(NSString *)nameToSet{
    self->name = nameToSet;
}

- (void)setStatus:(NSString *)statusToSet{
    self->status = statusToSet;
}

- (void)setRespawnTimer:(int)respawnTimerToSet{
    self->respawnTimer = respawnTimerToSet;
}

- (void)setAlive:(bool)aliveToSet{
    self->alive = aliveToSet;
}

- (void)setAfterKillRespawnTimer:(int)afterKillRespawnTimerToSet{
    self->afterKillRespawnTimer = afterKillRespawnTimerToSet;
}

@end
