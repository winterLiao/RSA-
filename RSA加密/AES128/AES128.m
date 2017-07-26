//
//  NSString+AES.m
//  test
//
//  Created by stdinlove on 14-9-16.
//  Copyright (c) 2014年 stdinlove. All rights reserved.
//
//AES128加密解密、MD5取值

#import "AES128.h"
#import "CommonCrypto/CommonDigest.h"
@implementation AES128

+ (NSString*)AES128EncryptedFromString:(NSString *)value key:(NSString *)key
{
    NSData *data = [value dataUsingEncoding:NSUTF8StringEncoding];
    NSData *en_data = [data AES128EncryptedDataWithKey:key];
    NSString *en_Value = [en_data hexUppercaseString];
    
    return en_Value;
}

+ (NSString*)AES128DecryptedFromString:(NSString *)value key:(NSString *)key
{
    NSData *enData = [[NSData alloc]initWithHexString:value];
    NSData *de_data = [enData AES128DecryptedDataWithKey:key];
    NSString *destr = [[NSString alloc] initWithData:de_data encoding:NSUTF8StringEncoding];
    return destr;
}

+ (NSString *)md5:(NSString *)inPutText
{
    const char *cStr = [inPutText UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
    
    return [NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

//md5 16位加密 （大写）
+ (NSString *)md5HexDigest:(NSString*)input
{
    const char* str = [input UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(str, strlen(str), result);
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH*2];//
    
    for(int i = 0; i<CC_MD5_DIGEST_LENGTH; i++) {
        [ret appendFormat:@"%02X",result[i]];
    }
    return ret;
}




@end
