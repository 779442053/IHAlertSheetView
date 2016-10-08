//
//  IHAlertSheettAction.h
//  IHAlertAction
//
//  Created by ___liangdahong on 16/10/8.
//  Copyright © 2016年 http://idhong.com/. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IHAlertSheettAction : NSObject

@property (nonatomic, copy, readonly) NSString *title;

@property (nonatomic, copy, readonly) dispatch_block_t handlerBlock;

+ (instancetype)alertSheettActionWithTitle:(NSString *)title handler:(dispatch_block_t)handler;

@end
