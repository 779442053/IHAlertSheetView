//
//  IHAlertSheettAction.m
//  IHAlertAction
//
//  Created by ___liangdahong on 16/10/8.
//  Copyright © 2016年 http://idhong.com/ All rights reserved.
//

#import "IHAlertSheettAction.h"

@interface IHAlertSheettAction ()
@property (nonatomic, copy, readwrite) NSString *title;
@property (nonatomic, copy, readwrite) dispatch_block_t handlerBlock;
@end

@implementation IHAlertSheettAction

+ (instancetype)alertSheettActionWithTitle:(NSString *)title handler:(dispatch_block_t)handler {
    IHAlertSheettAction *alertAction = [IHAlertSheettAction new];
    alertAction.title = title;
    alertAction.handlerBlock = handler;
    return alertAction;
}
@end
