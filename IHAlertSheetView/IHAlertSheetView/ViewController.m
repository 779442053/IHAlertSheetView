//
//  ViewController.m
//  IHAlertSheetView
//
//  Created by ___liangdahong on 16/10/8.
//  Copyright © 2016年 http://idhong.com/. All rights reserved.
//

#import "ViewController.h"
#import "SVProgressHUD.h"
#import "IHAlertActionSheet.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)sheet:(id)sender {
    IHAlertActionSheet *alertActionSheet = [IHAlertActionSheet sheetWithTitle:@"分享到以下平台" cancelTitle:@"cancel" handlerBlock:^{
        [SVProgressHUD showSuccessWithStatus:@"cancel"];
    }];
    [alertActionSheet addButtonWithTitle:@"QQ" handlerBlock:^{
        [SVProgressHUD showSuccessWithStatus:@"QQ"];
    }];
    [alertActionSheet addButtonWithTitle:@"WB" handlerBlock:^{
        [SVProgressHUD showSuccessWithStatus:@"WB"];
    }];
    [alertActionSheet show];
}

- (IBAction)sheet1:(id)sender {
    
    IHAlertActionSheet *alertActionSheet = [IHAlertActionSheet sheetWithTitle:@"分享到以下平台1" cancelTitle:nil handlerBlock:^{
        [SVProgressHUD showSuccessWithStatus:@"cancel"];
    }];
    [alertActionSheet addButtonWithTitle:@"QQ" handlerBlock:^{
        [SVProgressHUD showSuccessWithStatus:@"QQ"];
    }];
    [alertActionSheet addButtonWithTitle:@"WB" handlerBlock:^{
        [SVProgressHUD showSuccessWithStatus:@"WB"];
    }];
    [alertActionSheet show];
}

- (IBAction)sheet2:(id)sender {
    IHAlertActionSheet *alertActionSheet = [IHAlertActionSheet sheetWithTitle:@"分享到以下平台2" cancelTitle:nil handlerBlock:^{
        [SVProgressHUD showSuccessWithStatus:@"cancel"];
    }];
    [alertActionSheet addButtonWithTitles:@[@"QQ", @"WB"] handlerBlock:^(NSInteger index) {
        [SVProgressHUD showSuccessWithStatus:@[@"QQ", @"WB"][index]];
    }];
    [alertActionSheet show];
}

- (IBAction)sheet3:(id)sender {
    IHAlertActionSheet *alertActionSheet = [IHAlertActionSheet sheetWithTitle:@"分享到以下平台2" cancelTitle:nil handlerBlock:^{
        [SVProgressHUD showSuccessWithStatus:@"cancel"];
    }];
    [alertActionSheet addButtonWithTitle:@"QQ" handlerBlock:^{
        [SVProgressHUD showSuccessWithStatus:@"QQ"];
    }];
    [alertActionSheet addButtonWithTitle:@"WB" handlerBlock:^{
        [SVProgressHUD showSuccessWithStatus:@"WB"];
    }];
    [alertActionSheet addButtonWithTitles:@[@"QQ", @"WB"] handlerBlock:^(NSInteger index) {
        [SVProgressHUD showSuccessWithStatus:@[@"QQ", @"WB"][index]];
    }];
    [alertActionSheet show];
    [self sheet2:nil];
}

- (IBAction)alert:(id)sender {
    IHAlertActionSheet *alertActionSheet = [IHAlertActionSheet alertWithTitle:@"提示" message:@"MNESS"];
    [alertActionSheet addButtonWithTitle:@"取消" handlerBlock:^{
        [SVProgressHUD showSuccessWithStatus:@"取消"];
    }];
    [alertActionSheet addButtonWithTitle:@"确定" handlerBlock:^{
        [SVProgressHUD showSuccessWithStatus:@"确定"];
    }];
    [alertActionSheet show];
}


- (IBAction)alert1:(id)sender {
    IHAlertActionSheet *alertActionSheet = [IHAlertActionSheet alertWithTitle:@"提示" message:@"MNESS"];
    
    [alertActionSheet addButtonWithTitle:@"取消" handlerBlock:^{
        [SVProgressHUD showSuccessWithStatus:@"取消"];
    }];
    [alertActionSheet addButtonWithTitle:@"确定" handlerBlock:^{
        [SVProgressHUD showSuccessWithStatus:@"确定"];
    }];
    
    [alertActionSheet addButtonWithTitles:@[@"1", @"2"] handlerBlock:^(NSInteger index) {
        [SVProgressHUD showSuccessWithStatus:@[@"1", @"2"][index]];
    }];
    [alertActionSheet addButtonWithTitle:@"3" handlerBlock:^{
        [SVProgressHUD showSuccessWithStatus:@"3"];
    }];
    [alertActionSheet show];
}

- (IBAction)alert2:(id)sender {
    IHAlertActionSheet *alertActionSheet = [IHAlertActionSheet alertWithTitle:@"提示" message:nil];
    [alertActionSheet addButtonWithTitle:@"取消" handlerBlock:^{
        [SVProgressHUD showSuccessWithStatus:@"取消"];
    }];
    [alertActionSheet addButtonWithTitle:@"确定" handlerBlock:^{
        [SVProgressHUD showSuccessWithStatus:@"确定"];
    }];
    [alertActionSheet show];
}

- (IBAction)alert3:(id)sender {

    IHAlertActionSheet *alertActionSheet = [IHAlertActionSheet alertWithTitle:@"提示" message:@"MNESS"];
    [alertActionSheet addButtonWithTitle:@"取消" handlerBlock:^{
        [SVProgressHUD showSuccessWithStatus:@"取消"];
    }];
    [alertActionSheet addButtonWithTitle:@"确定" handlerBlock:^{
        [SVProgressHUD showSuccessWithStatus:@"确定"];
    }];
    [alertActionSheet show];
}

- (IBAction)alert4:(id)sender {
    IHAlertActionSheet *alertActionSheet = [IHAlertActionSheet alertWithTitle:@"提示" message:@"MNESS"];
    [alertActionSheet addButtonWithTitle:@"取消" handlerBlock:^{
        [SVProgressHUD showSuccessWithStatus:@"取消"];
    }];
    [alertActionSheet addButtonWithTitle:@"确定" handlerBlock:^{
        [SVProgressHUD showSuccessWithStatus:@"确定"];
    }];
    [alertActionSheet show];
}

@end
