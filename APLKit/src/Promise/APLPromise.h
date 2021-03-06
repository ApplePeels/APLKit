//
//  APLPromise.h
//  APLPromise
//
//  Created by ApplePeel on 2019/4/16.
//  Copyright © 2019 ApplePeel. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

//async函数内返回值
#define ASYNC_RESULT(value)   result(value)

//定义async函数(类方法、实例方法)
#define ASYNC_CLASS_METHOD(name, function)  ASYNC_METHOD(+, name, function)
#define ASYNC_INSTANCE_METHOD(name, function)   ASYNC_METHOD(-, name, function)

#define ASYNC_METHOD(qualifier, name, function)    \
    qualifier (void(^)(APLPromiseResult))async_##name {\
        return ^(APLPromiseResult result) {\
            function    \
        };  \
    }\

/* Example
 ASYNC_INSTANCE_METHOD(testWithFunction:(NSString*)value, {
 dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
 ASYNC_RESULT(value);
 });
 })
 
 [self async_testWithFunction:@"testFunctionValue"]];
 */

typedef void(^APLPromiseResult)(id);

@interface APLPromise : NSObject

+ (void)async:(void(^)(APLPromise* promise))block;

- (id)await:(void(^)(APLPromiseResult result))block;

@end

NS_ASSUME_NONNULL_END
