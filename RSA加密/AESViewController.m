//
//  AESViewController.m
//  RSA加密
//
//  Created by liaowentao on 17/7/25.
//  Copyright © 2017年 Haochuang. All rights reserved.
//

#import "AESViewController.h"
#import "AES128.h"
#define AESKEY @"2123132"

@interface AESViewController ()
@property (weak, nonatomic) IBOutlet UITextField *inputTextField;
@property (weak, nonatomic) IBOutlet UILabel *encryLabel;
@property (weak, nonatomic) IBOutlet UILabel *dencryLabel;

@end

@implementation AESViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)buttonAction:(UIButton *)sender {
    
    NSString *encryStirng = [AES128 AES128EncryptedFromString:_inputTextField.text key:AESKEY];
    _encryLabel.text = [NSString stringWithFormat:@"加密后:%@",encryStirng];
    NSString *dencryString = [AES128 AES128DecryptedFromString:encryStirng key:AESKEY];
    _dencryLabel.text = [NSString stringWithFormat:@"解密后:%@",dencryString];
    
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
