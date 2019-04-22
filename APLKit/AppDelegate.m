//
//  AppDelegate.m
//  APLKit
//
//  Created by ApplePeel on 2019/4/19.
//  Copyright © 2019年 ApplePeel. All rights reserved.
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
