//
//  APLFileLogUtils.m
//  APLKit
//
//  Created by 苹果皮 on 2019/5/14.
//  Copyright © 2019年 ApplePeel. All rights reserved.
//

#import "APLFileLogUtils.h"
#import "APLFileLogManager.h"
#import "APLMacros.h"

#import <DDFileLogger.h>

@interface APLFileLogUtils ()
@property (nonatomic, strong) NSMutableDictionary* fileLoggerDic;
@end

@implementation APLFileLogUtils

SHAREDINSTANCE_IMPLEMENT(Utils, APLFileLogUtils)

+ (NSString*)getLogFileDir {
    NSString* documentDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString* logDir = [documentDir stringByAppendingPathComponent:@"Log"];
    return logDir;
}

+ (void)registerLogType:(NSString*)logType {
    [[self sharedUtils] __registerLogType:logType];
}

+ (DDFileLogger*)getFileLogger:(NSString*)logType {
    return [[self sharedUtils] __getFileLogger:logType];
}

+ (DDLogMessage *)makeLogMessage:(const char *)file function:(const char *)function line:(NSUInteger)line message:(NSString *)format, ... {
    va_list args;
    va_start(args, format);
    NSString *message = [[NSString alloc] initWithFormat:format arguments:args];
    
    DDLogMessage* logMessage = [[DDLogMessage alloc] initWithLogMsg:message level:LOG_LEVEL_VERBOSE flag:LOG_FLAG_VERBOSE context:0 file:file function:function line:line tag:0 options:0 timestamp:nil];
    va_end(args);
    
    return logMessage;
}

- (void)__registerLogType:(NSString*)logType {
    NSString* logPath = [APLFileLogUtils getLogFileDir];
    logPath = [logPath stringByAppendingPathComponent:logType];
    
    APLFileLogManager* logFileManager = [[APLFileLogManager alloc] initWithLogsDirectory:logPath];
    DDFileLogger* fileLogger = [[DDFileLogger alloc] initWithLogFileManager:logFileManager];
    
    self.fileLoggerDic[logType] = fileLogger;
}

- (DDFileLogger*)__getFileLogger:(NSString*)logType {
    return self.fileLoggerDic[logType];
}

#pragma mark Getter
- (NSMutableDictionary*)fileLoggerDic {
    if (!_fileLoggerDic) {
        _fileLoggerDic = [NSMutableDictionary dictionary];
    }
    return _fileLoggerDic;
}

@end
