//
//  APLFileLogManager.m
//  APLKit
//
//  Created by 苹果皮 on 2019/5/14.
//  Copyright © 2019年 ApplePeel. All rights reserved.
//

#import "APLFileLogManager.h"

@implementation APLFileLogManager

- (NSString *)newLogFileName {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlag = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute;
    NSDateComponents* curTimeComponents = [calendar components:unitFlag fromDate:[NSDate date]];
    NSString* logFileName = [NSString stringWithFormat:@"%ld-%02ld-%02ld %02ld:%02ld.log", curTimeComponents.year, curTimeComponents.month, curTimeComponents.day, curTimeComponents.hour, curTimeComponents.minute];
    return logFileName;
}

- (BOOL)isLogFile:(NSString *)fileName {
    return YES;
}

@end
