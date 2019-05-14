//
//  APLTestUtils.m
//  APLKit
//
//  Created by ApplePeel on 2019/4/19.
//  Copyright © 2019年 ApplePeel. All rights reserved.
//

#import "APLTestUtils.h"

#import "APLFileLogDefs.h"
#import "APLFileLogUtils.h"

#import "APLTuple.h"
#import "APLPromise.h"


#define AAA_Log(frmt, ...) APLFileLog([APLFileLogUtils getFileLogger:@"aaa"], frmt, ##__VA_ARGS__)


@implementation APLTestUtils

#pragma mark Tuple
+ (void)testTuple {
    APLTuple* tuple = [APLTuple tupleWithArray:@[@"aaa", @(222)]];
    NSLog(@"tuple: %@ %@", tuple.first, tuple.second);
}

#pragma mark Promise
ASYNC_CLASS_METHOD(testWithFunction:(NSString*)value, {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        ASYNC_RESULT(value);
    });
})

+ (void)testPromise {
    __block NSInteger index = 0;
    [APLPromise async:^(APLPromise* _Nonnull promise){
        NSString* value = [promise await:[self async_testWithFunction:@"testFunctionValue"]];
        NSLog(@"value %@", value);
        id ret1 = [promise await:^(APLPromiseResult result) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                index++;
                result(@(index));
            });
        }];
        NSLog(@"ret1 %@", ret1);
        APLTuple* tupleRet = [promise await:^(APLPromiseResult result) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                index++;
                APLTuple* tuple = [APLTuple tupleWithArray:@[@"1111", @(222)]];
                result(tuple);
            });
        }];
        NSLog(@"retTuple %@  %ld", tupleRet.first, [tupleRet.second integerValue]);
        
        NSLog(@"index:%ld", index);
    }];
}

+ (void)testLog {
    [APLFileLogUtils registerLogType:@"aaa"];
    [APLFileLogUtils registerLogType:@"bbb"];
    NSLog(@"log dir:%@", [APLFileLogUtils getLogFileDir]);
    
    AAA_Log(@"test marcor:%@", @"complete");
    
}
@end
