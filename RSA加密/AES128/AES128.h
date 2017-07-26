//
//  NSString+AES.h
//  test
//
//  Created by stdinlove on 14-9-16.
//  Copyright (c) 2014年 stdinlove. All rights reserved.
//
//AES128加密解密、MD5取值

#import <Foundation/Foundation.h>
#import "NSData+AES.h"
@interface AES128 : NSObject

/**
 *  AES加密
 *
 *  @param value 要加密的字符串
 *  @param key   AES秘钥
 *
 *  @return AES加密后的字符串
 */
+ (NSString*)AES128EncryptedFromString:(NSString *)value key:(NSString *)key;
/**
 *  AES 解密
 *
 *  @param value 要解密的字符串
 *  @param key   AES秘钥
 *
 *  @return AES解密后的字符串
 */
+ (NSString*)AES128DecryptedFromString:(NSString *)value key:(NSString *)key;
/**
 *  md5签名
 *
 *  @param inPutText 加密字符串
 *
 *  @return 签名结果
 */
+(NSString *)md5:(NSString *)inPutText;
+ (NSString *)md5HexDigest:(NSString*)input;
@end
