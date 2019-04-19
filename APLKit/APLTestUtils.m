//
//  APLTestUtils.m
//  APLKit
//
//  Created by 苹果皮 on 2019/4/19.
//  Copyright © 2019年 AiJia. All rights reserved.
//

#import "APLTestUtils.h"
#import "APLPromise.h"
#import "APLPromiseDefs.h"

@implementation APLTestUtils

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
        id ret2 = [promise await:^(APLPromiseResult result) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                index++;
                result(@(index));
            });
        }];
        NSLog(@"ret2 %@", ret2);
        
        NSLog(@"index:%ld", index);
    }];
}

@end
