//
//  APLTimerUtils.h
//  APLKit
//
//  Created by ApplePeel on 2019/4/23.
//  Copyright © 2019 ApplePeel. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface APLTimerUtils : NSObject

+ (NSTimer *)scheduledWithTimeInterval:(NSTimeInterval)interval block:(void(^)(void))block repeats:(BOOL)repeats;

@end

NS_ASSUME_NONNULL_END
