//
//  APLMacros.h
//  APLKit
//
//  Created by ApplePeel on 2019/4/22.
//  Copyright © 2019 ApplePeel. All rights reserved.
//

#ifndef APLMacros_h
#define APLMacros_h

//weakSelf
#ifndef WEAK_SELF
#define WEAK_SELF __weak typeof(self) weakSelf = self;
#endif

#ifndef STRONG_SELF
#define STRONG_SELF typeof(self) self = weakSelf;
#endif

//dispatch_main_async_safe
#ifndef DISPATCH_MAIN_ASYNC
#define DISPATCH_MAIN_ASYNC(block) DISPATCH_QUEUE_ASYNC(dispatch_get_main_queue(), block)
#endif

#ifndef DISPATCH_QUEUE_ASYNC
#define DISPATCH_QUEUE_ASYNC(queue, block)\
if (dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL) == dispatch_queue_get_label(queue)) {\
    block();\
} else {\
    dispatch_async(queue, block);\
}
#endif

//单例
#ifndef SHAREDINSTANCE_DECLARE
#define SHAREDINSTANCE_DECLARE(Name)  +(instancetype)shared##Name;
#endif

#ifndef SHAREDINSTANCE_IMPLEMENT
#define ASHAREDINSTANCE_IMPLEMENT(Name, ClassName)\
+(instancetype)shared##Name {\
    static dispatch_once_t s_once;\
    static ClassName* s_instance = nil;\
    dispatch_once(&s_once, ^{\
        s_instance = [[ClassName alloc] init];\
    });\
    return s_instance;\
}
#endif

//导航栏(含状态栏  44+20)
#ifndef NAVGATION_HEIGHT
#define NAVGATION_HEIGHT    ([UIScreen mainScreen].bounds.size.height==812?88:64)
#endif

//获取屏幕 宽度、高度
#ifndef SCREEN_WIDTH
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#endif

#ifndef SCREEN_HEIGHT
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#endif

//iPhoneX
#ifndef IsIphoneX()
#define IsIphoneX() ([UIScreen mainScreen].bounds.size.height==812)
#endif

#endif /* APLMacros_h */
