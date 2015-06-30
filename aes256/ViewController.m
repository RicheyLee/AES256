//
//  ViewController.m
//  aes256
//
//  Created by Richey on 15/5/25.
//  Copyright (c) 2015年 Richey. All rights reserved.
//

#import "ViewController.h"
#import "NSData+Base64.h"
#import "NSData+AES256.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *key = @"abcdef1234567890";
    
    
    NSString *str = [NSString stringWithFormat:@"[{\"departid\":\"2\",\"department\":\"\u7f51\u7edc\u90e8\"}]"];
    
    NSData *plain = [str dataUsingEncoding:NSUTF8StringEncoding];
    NSData *eData = [plain AES256EncryptWithKey:key];
    NSString *secretString = [eData base64EncodedString];
    NSLog(@"encrypted string:%@",secretString);
    
    
    
    
    NSString *enString = [NSString stringWithString:secretString];
    NSData *cipher = [NSData dataFromBase64String:enString];
    NSData *bDecrypt = [cipher AES256DecryptWithKey:key];
    NSString *dateString = [[NSString alloc] initWithData:bDecrypt encoding:NSASCIIStringEncoding];
    NSLog(@"decrypted string:%@",dateString);

    
    
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
