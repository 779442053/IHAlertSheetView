//
//  ViewController.m
//  IHAlertSheetView
//
//  Created by ___liangdahong on 16/10/8.
//  Copyright © 2016年 http://idhong.com/. All rights reserved.
//

#import "ViewController.h"
#import "IHAlertSheetView.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)alert:(id)sender {
    
    IHAlertSheetView *alertSheet = [IHAlertSheetView alertWithTitle:@"温馨提示" message:nil];
    [alertSheet addAction:[IHAlertSheettAction alertSheettActionWithTitle:@"OK" handler:^{
        NSLog(@"OK");
    }]];
    [alertSheet addAction:[IHAlertSheettAction alertSheettActionWithTitle:@"CANCEL" handler:^{
        NSLog(@"CANCEL");
    }]];
    [alertSheet show];
}

- (IBAction)sheet:(id)sender {
    
    IHAlertSheetView *alertSheet = [IHAlertSheetView sheetWithTitle:@"温馨提示" message:nil cancelTitle: nil  handler:^{
        NSLog(@"cencel");
    }];
    [alertSheet addAction:[IHAlertSheettAction alertSheettActionWithTitle:@"OK" handler:^{
        NSLog(@"OK");
    }]];
    [alertSheet addAction:[IHAlertSheettAction alertSheettActionWithTitle:@"CANCEL" handler:^{
        NSLog(@"CANCEL");
    }]];
    [alertSheet show];
}

@end
