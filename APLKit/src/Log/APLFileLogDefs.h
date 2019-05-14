//
//  APLFileLogDefs.h
//  APLKit
//
//  Created by 苹果皮 on 2019/5/14.
//  Copyright © 2019年 ApplePeel. All rights reserved.
//

#ifndef APLFileLogDefs_h
#define APLFileLogDefs_h

//打印日志宏
#define APLFileLog(fileLogger,frmt, ...) \
[fileLogger logMessage:[APLFileLogUtils makeLogMessage:__FILE__ function:__PRETTY_FUNCTION__ line:__LINE__ message:(frmt), ## __VA_ARGS__]]

/*
 [APLFileLogUtils registerLogType:@"Test"];
 #define APLLogTest(frmt, ...) APLFileLog([APLFileLogUtils getFileLogger:@"Test"]], frmt, ##__VA_ARGS__)
 APLLogTest(@"test loginfo:%@", @"complete");
 */

#endif /* APLFileLogDefs_h */
