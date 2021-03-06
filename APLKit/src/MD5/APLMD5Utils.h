//
//  APLMD5Utils.h
//  APLKit
//
//  Created by ApplePeel on 2019/4/22.
//  Copyright © 2019 ApplePeel. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface APLMD5Utils : NSObject

+ (NSString*)md5WithStr:(NSString*)str;
+ (NSString*)md5WithData:(NSData*)data;

@end

NS_ASSUME_NONNULL_END
