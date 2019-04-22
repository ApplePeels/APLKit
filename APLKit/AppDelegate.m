//
//  AppDelegate.m
//  APLKit
//
//  Created by 苹果皮 on 2019/4/19.
//  Copyright © 2019年 AiJia. All rights reserved.
//

#import "AppDelegate.h"
#import "APLTestUtils.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [APLTestUtils testTuple];
    
    [APLTestUtils testPromise];
    
    return YES;
}



@end
