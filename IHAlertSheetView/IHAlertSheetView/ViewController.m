//
//  ViewController.m
//  IHAlertSheetView
//
//  Created by ___liangdahong on 16/10/8.
//  Copyright © 2016年 http://idhong.com/. All rights reserved.
//

#import "ViewController.h"
#import "IHAlertSheetView.h"
#import "SVProgressHUD.h"

@interface ViewController ()

@end

@implementation ViewController


- (IBAction)sheet:(id)sender {

    IHAlertSheetView *alertSheet = [IHAlertSheetView sheetWithTitle:@"分享到以下平台" message:nil cancelTitle:@"取消" handler:nil];
    [alertSheet addButtonWithTitle:@"QQ" handler:^{
        [SVProgressHUD showSuccessWithStatus:@"分享到 QQ"];
    }];
    [alertSheet addButtonWithTitle:@"新浪微博" handler:^{
        [SVProgressHUD showSuccessWithStatus:@"分享到 新浪微博"];
    }];
    [alertSheet show];

}

- (IBAction)alert:(id)sender {

    IHAlertSheetView *alertSheetView = [IHAlertSheetView alertWithTitle:@"是否继续此操作？" message:nil];
    [alertSheetView addButtonWithTitle:@"确定" handler:^{
        [SVProgressHUD showSuccessWithStatus:@"确定"];
    }];
    [alertSheetView addButtonWithTitle:@"取消" handler:^{
        [SVProgressHUD showSuccessWithStatus:@"取消"];
    }];
    [alertSheetView show];
}
@end
