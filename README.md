# RSA-
RSA签名
```
    HBRSAHandler* handler = [HBRSAHandler new];
    [handler importKeyWithType:KeyTypePrivate andkeyString:private_key_string];
    [handler importKeyWithType:KeyTypePublic andkeyString:public_key_string];
    
    NSString* sig = [handler signString:_inputTextField.text];
    _signedString.text = [NSString stringWithFormat:@"签名后：%@",sig];
    BOOL a = [handler verifyString:_inputTextField.text withSign:sig];
    if (a) {
        _unsignedString.text = @"验签成功";
    }else{
        _unsignedString.text = @"验签失败";
    }
```
RSA加密
```
    
    NSString *encryptStr = [RSAEncryptor encryptString:originalString publicKey:RSAPUBLICKEY];
    
    NSLog(@"加密前:%@", originalString);
    NSLog(@"加密后:%@", encryptStr);;
    
    self.encryLabel.text = [NSString stringWithFormat:@"加密后:%@",encryptStr];
    NSLog(@"%@",encryptStr);
    
    self.decryLabel.text = [NSString stringWithFormat:@"解密后:%@",[RSAEncryptor decryptString:encryptStr privateKey:PRIVATEKEY];
```
