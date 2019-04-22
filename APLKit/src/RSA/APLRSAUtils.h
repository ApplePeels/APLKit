//
//  APLRSAUtils.h
//  iOSUtils
//
//  Created by 苹果皮 on 2018/11/13.
//  Copyright © 2018年 ApplePeel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APLRSAUtils : NSObject

//加密
+ (NSData *)encryptData:(NSData *)data publicKey:(NSString *)pubKey;
+ (NSData *)encryptData:(NSData *)data privateKey:(NSString *)privKey;
+ (NSString *)encryptString:(NSString *)str publicKey:(NSString *)pubKey;
+ (NSString *)encryptString:(NSString *)str privateKey:(NSString *)privKey;

//解密
+ (NSData *)decryptData:(NSData *)data publicKey:(NSString *)pubKey;
+ (NSData *)decryptData:(NSData *)data privateKey:(NSString *)privKey;
+ (NSString *)decryptString:(NSString *)str publicKey:(NSString *)pubKey;
+ (NSString *)decryptString:(NSString *)str privateKey:(NSString *)privKey;

@end

