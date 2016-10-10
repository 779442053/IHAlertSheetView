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
#import "IHAlertActionSheet.h"

@interface ViewController ()

@end

@implementation ViewController


- (IBAction)sheet:(id)sender {
    
    IHAlertActionSheet *alertActionSheet = [IHAlertActionSheet sheetWithTitle:@"分享到以下平台" cancelTitle:@"cancel" handler:^{
    }];
    [alertActionSheet addButtonWithTitle:@"QQ" handler:^{
        [SVProgressHUD showSuccessWithStatus:@"QQ"];
    }];
    [alertActionSheet addButtonWithTitle:@"WB" handler:^{
        [SVProgressHUD showSuccessWithStatus:@"WB"];
    }];
    [alertActionSheet show];

}

- (IBAction)alert:(id)sender {
    
    IHAlertActionSheet *alertActionSheet = [[IHAlertActionSheet alloc] initWithTitle:@"title" message:nil];
    [alertActionSheet addButtonWithTitle:@"确定" handler:^{
        [SVProgressHUD showSuccessWithStatus:@"确定"];
    }];
    [alertActionSheet addButtonWithTitle:@"取消" handler:^{
        [SVProgressHUD showSuccessWithStatus:@"取消"];
    }];
    [alertActionSheet show];
}
@end
