//
//  NSTimer+APLBlock.m
//  APLKit
//
//  Created by ApplePeel on 2019/4/22.
//  Copyright © 2019 ApplePeel. All rights reserved.
//

#import "NSTimer+APLBlock.h"

@implementation NSTimer (APLBlock)

+ (NSTimer *)apl_scheduledWithTimeInterval:(NSTimeInterval)interval block:(void(^)(void))block repeats:(BOOL)repeats {
    return [self scheduledTimerWithTimeInterval:interval target:self selector:@selector(_onBlockInvoke:) userInfo:block repeats:repeats];
}

+ (void)_onBlockInvoke:(NSTimer *)timer {
    void (^block)(void) = timer.userInfo;
    if(block) {
        block();
    }
}

@end
