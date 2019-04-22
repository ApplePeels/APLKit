//
//  NSTimer+APLBlock.h
//  APLKit
//
//  Created by wangxingming on 2019/4/22.
//  Copyright © 2019 AiJia. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSTimer (APLBlock)

+ (NSTimer *)apl_scheduledWithTimeInterval:(NSTimeInterval)interval block:(void(^)(void))block repeats:(BOOL)repeats;

@end

NS_ASSUME_NONNULL_END
