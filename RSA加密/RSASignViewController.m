//
//  RSASignViewController.m
//  RSA加密
//
//  Created by liaowentao on 17/7/25.
//  Copyright © 2017年 Haochuang. All rights reserved.
//

#import "RSASignViewController.h"
#import "HBRSAHandler.h"

@interface RSASignViewController ()
@property (weak, nonatomic) IBOutlet UILabel *signedString;
@property (weak, nonatomic) IBOutlet UILabel *unsignedString;

@property (weak, nonatomic) IBOutlet UITextField *inputTextField;
@end

@implementation RSASignViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)buttonAction:(UIButton *)sender {
    
    NSString* private_key_string = @"MIICdQIBADANBgkqhkiG9w0BAQEFAASCAl8wggJbAgEAAoGBALgv/syFH337KzC29KvR0p6cP+glRqjDYAQno5ifafXZjgf1EhBjZblKv+HiLAzNBOlYU1PnLuOOkZj6pg1A5HUZLpsbYa5Mwr1bUHALjXLaB3THCpZX51/b5L14erGo52Jv/j/63YljEtMm8ALmkY8S+3fPxFeY7ya+2VXMEtplAgMBAAECgYAguvauZWGpQ37zUy+7cLfa061PlYAu8TkYw+qAbqOnupdQtq4VF3S2LqBWhZiKVcxvovB70nM0oNsisjfb1xJBpyfDBFug7d+y2f8yr6aTOezoY5DBYEF3Svg9Kp9ra+vvAYX/7fh+tHCU0HOvp0z8ikZiRSWZaQ+3A2GiCIJrwQJBAPKVji89hGAMEWLJJFZaPiLBqZUwR2W/rp7Ely5ddKfjcosHhggHfOb71BnrMOm0h4S85Gx6a87n9R2To0c51q0CQQDCX6yYdt/9JGORyNSXfzMfSZyVOrMpIo77R0YwKa3UOwwLA56l2Lc4AYO10/lyAyZCKse2/5D9ZZUB7xoYEmGZAkB8MEJVPuoY/bSc3RqENrjetERsAwZaObJcx4oaC3AgTxmhwV1FmQfBfKTODBDDZE+Ijedm/ZlZmHhtBtstKJgVAkBKma/DgHRtUscIT90QHBjB3F3FhJb4pbPcyzksCQMXXmY73/LG0ktXqnUjlyy4zm6jnIm0OZgrOQ6chGkubfeZAkBMCGF2tPfEJh8XODOvlw5ADnUiq+Qe/abcpKowkiT9zP+rYT9XJAx7QxChjdwTZb6ahnJY1+ny1emEHUOs2fm8";
    
    
    NSString* public_key_string = @"MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC4L/7MhR99+yswtvSr0dKenD/oJUaow2AEJ6OYn2n12Y4H9RIQY2W5Sr/h4iwMzQTpWFNT5y7jjpGY+qYNQOR1GS6bG2GuTMK9W1BwC41y2gd0xwqWV+df2+S9eHqxqOdib/4/+t2JYxLTJvAC5pGPEvt3z8RXmO8mvtlVzBLaZQIDAQAB";
    
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
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
