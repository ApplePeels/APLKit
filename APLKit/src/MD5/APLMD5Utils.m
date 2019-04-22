//
//  APLMD5Utils.m
//  APLKit
//
//  Created by ApplePeel on 2019/4/22.
//  Copyright © 2019 ApplePeel. All rights reserved.
//

#import "APLMD5Utils.h"
#import <CommonCrypto/CommonDigest.h>

@implementation APLMD5Utils

+ (NSString*)md5WithStr:(NSString*)str {
    CC_MD5_CTX md5;
    CC_MD5_Init(&md5);
    CC_MD5_Update(&md5, [str UTF8String], (CC_LONG)[str length]);
    
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5_Final (digest, &md5);
    NSString *MD5Hash = [NSString stringWithFormat: @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
                         digest[0],  digest[1],
                         digest[2],  digest[3],
                         digest[4],  digest[5],
                         digest[6],  digest[7],
                         digest[8],  digest[9],
                         digest[10], digest[11],
                         digest[12], digest[13],
                         digest[14], digest[15]];
    
    return [MD5Hash uppercaseString];
}

+ (NSString*)md5WithData:(NSData*)data {
    NSString * dataStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return [self md5WithStr:dataStr];
}

@end
