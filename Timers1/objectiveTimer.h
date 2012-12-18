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

@property NSString *name;
@property NSString *status;
@property int respawnTimer;
@property bool alive;
@property int afterKillRespawnTimer;

- (id)initWithName:(NSString *)objectiveName;
- (void)tick;
- (void)kill;


@end
