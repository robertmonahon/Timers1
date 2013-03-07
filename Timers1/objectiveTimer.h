//
//  objectiveTimer.h
//  Timers1
//
//  Created by Robert Monahon on 12/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface objectiveTimer : NSObject
{
    NSString *name;
    NSString *status;
    int respawnTimer;
    bool alive;
    int afterKillRespawnTimer;
}

- (id)initWithName:(NSString *)objectiveName;
- (void)tick;
- (void)kill;

- (NSString *)getName;
- (NSString *)getStatus;
- (int)getCurrentTimer;
- (bool)getAlive;
- (int)getResetTimer;

- (void)setName:(NSString *)nameToSet;
- (void)setStatus:(NSString *)statusToSet;
- (void)setRespawnTimer:(int)respawnTimerToSet;
- (void)setAlive:(bool)aliveToSet;
- (void)setAfterKillRespawnTimer:(int)afterKillRespawnTimerToSet;


@end
