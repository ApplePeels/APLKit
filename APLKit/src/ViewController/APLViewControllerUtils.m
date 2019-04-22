//
//  APLViewControllerUtils.m
//  APLKit
//
//  Created by wangxingming on 2019/4/22.
//  Copyright © 2019 AiJia. All rights reserved.
//

#import "APLViewControllerUtils.h"

@implementation APLViewControllerUtils

+ (UIViewController*)getTopViewController {
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    UIViewController *topViewController = keyWindow.rootViewController;
    while (topViewController.presentedViewController) {
        topViewController = topViewController.presentedViewController;
    }
    
    if ([topViewController isKindOfClass:[UINavigationController class]]) {
        topViewController = ((UINavigationController*)topViewController).topViewController;
    }
    
//    if ([topVC isKindOfClass:[SaicFrostedViewController class]]) {
//        SaicFrostedViewController *frostedVC = (SaicFrostedViewController *)topVC;
//        UINavigationController *nc = (UINavigationController *)frostedVC.contentViewController;
//        topVC = nc.topViewController;
//    }
    
    if ([topViewController isKindOfClass:[UITabBarController class]]) {
        topViewController = ((UITabBarController*)topViewController).selectedViewController;
    }
    
    return topViewController;
}

@end
