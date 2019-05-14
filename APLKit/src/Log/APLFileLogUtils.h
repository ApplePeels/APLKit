//
//  APLFileLogUtils.h
//  APLKit
//
//  Created by 苹果皮 on 2019/5/14.
//  Copyright © 2019年 ApplePeel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APLFileLogDefs.h"
#import <DDFileLogger.h>

NS_ASSUME_NONNULL_BEGIN

@interface APLFileLogUtils : NSObject

+ (NSString*)getLogFileDir;

+ (void)registerLogType:(NSString*)logType;

+ (DDFileLogger*)getFileLogger:(NSString*)logType;

+ (DDLogMessage *)makeLogMessage:(const char *)file function:(const char *)function line:(NSUInteger)line message:(NSString *)format, ... ;
@end

NS_ASSUME_NONNULL_END
