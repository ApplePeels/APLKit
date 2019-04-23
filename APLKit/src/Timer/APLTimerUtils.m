//
//  APLTimerUtils.m
//  APLKit
//
//  Created by ApplePeel on 2019/4/23.
//  Copyright © 2019 ApplePeel. All rights reserved.
//

#import "APLTimerUtils.h"

@implementation APLTimerUtils

+ (NSTimer *)scheduledWithTimeInterval:(NSTimeInterval)interval block:(void(^)(void))block repeats:(BOOL)repeats {
    return [NSTimer scheduledTimerWithTimeInterval:interval target:self selector:@selector(_onBlockInvoke:) userInfo:block repeats:repeats];
}

+ (void)_onBlockInvoke:(NSTimer *)timer {
    void (^block)(void) = timer.userInfo;
    if(block) {
        block();
    }
}

@end
