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

- (IBAction)test1:(id)sender {
    IHAlertSheetView *alertSheet = [IHAlertSheetView alertWithTitle:@"温馨提示" message:nil];
    [alertSheet addAction:[IHAlertSheettAction alertSheettActionWithTitle:@"OK" handler:^{
        NSLog(@"OK");
    }]];
    int arc = arc4random_uniform(5)+1;
    while (arc--) {
        [alertSheet addAction:[IHAlertSheettAction alertSheettActionWithTitle:[NSString stringWithFormat:@"button-%d", arc] handler:^{
            NSLog(@"button - %d", arc);
        }]];
    }
    [alertSheet show];
}

- (IBAction)test2:(id)sender {
    IHAlertSheetView *alertSheet = [IHAlertSheetView sheetWithTitle:@"温馨提示" message:nil cancelTitle:nil handler:nil];
    
    [alertSheet addAction:[IHAlertSheettAction alertSheettActionWithTitle:@"OK" handler:^{
        NSLog(@"OK");
    }]];
    int arc = arc4random_uniform(5)+1;
    while (arc--) {
        [alertSheet addAction:[IHAlertSheettAction alertSheettActionWithTitle:[NSString stringWithFormat:@"button-%d", arc] handler:^{
            NSLog(@"button - %d", arc);
        }]];
    }
    [alertSheet show];
}

- (IBAction)test3:(id)sender {
    IHAlertSheetView *alertSheet = [IHAlertSheetView sheetWithTitle:@"温馨提示" message:nil cancelTitle:@"cancel"  handler:^{
        NSLog(@"cencel");
    }];
    [alertSheet addAction:[IHAlertSheettAction alertSheettActionWithTitle:@"OK" handler:^{
        NSLog(@"OK");
    }]];

    int arc = arc4random_uniform(5)+1;
    while (arc--) {
        [alertSheet addAction:[IHAlertSheettAction alertSheettActionWithTitle:[NSString stringWithFormat:@"button-%d", arc] handler:^{
            NSLog(@"button - %d", arc);
        }]];
    }
    [alertSheet show];
}

@end
