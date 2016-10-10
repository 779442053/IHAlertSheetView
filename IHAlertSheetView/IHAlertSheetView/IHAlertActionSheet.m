//
//  IHAlertActionSheet.m
//  IHAlertSheetView
//
//  Created by __liangdahong on 16/10/10.
//  Copyright © 2016年 http://idhong.com/. All rights reserved.
//

#import "IHAlertActionSheet.h"
#import <objc/runtime.h>

#define kIHSystemVersionFloatValue      6.0

@interface IHAlertActionSheet () <UIAlertViewDelegate, UIActionSheetDelegate>

@property (nonatomic, strong) UIAlertView *alertView;
@property (nonatomic, strong) UIActionSheet *actionSheet;
@property (nonatomic, strong) NSMutableArray <dispatch_block_t> *blocks;
@property (nonatomic, strong) UIAlertController *alertController;

@end

@implementation IHAlertActionSheet

- (NSMutableArray<dispatch_block_t> *)blocks {
    if (!_blocks) {
        _blocks = [@[] mutableCopy];
    }
    return _blocks;
}

/*!
 *  @brief 创建 alert
 */

- (nonnull instancetype)initWithTitle:(nullable NSString *)title message:(nullable NSString *)message {
    if (self = [super init]) {
        [self.blocks removeAllObjects];
        self.actionSheet = nil;
        if (kIHSystemVersionFloatValue < 8.0) {
            self.alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
            self.alertController = nil;
        }else {
            self.alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
            self.alertView = nil;
        }
    }
    return self;
}
/*!
 *  @brief 创建 sheet
 */
+ (nonnull instancetype)sheetWithTitle:(nullable NSString *)title
                           cancelTitle:(nullable NSString *)cancelTitle
                               handler:(nullable dispatch_block_t)handler {
    IHAlertActionSheet *alertActionSheet = [IHAlertActionSheet new];

    [alertActionSheet.blocks removeAllObjects];
    alertActionSheet.alertView = nil;

    if (kIHSystemVersionFloatValue < 8.0) {
        alertActionSheet.alertController = nil;
        alertActionSheet.actionSheet = [[UIActionSheet alloc] initWithTitle:title delegate:alertActionSheet cancelButtonTitle:cancelTitle destructiveButtonTitle:nil otherButtonTitles:nil, nil];
        if (cancelTitle) {
            [alertActionSheet.blocks addObject: handler ? handler : ^{}];
        }
        objc_setAssociatedObject(alertActionSheet, _cmd, alertActionSheet, OBJC_ASSOCIATION_COPY_NONATOMIC);
    }else {
        alertActionSheet.actionSheet = nil;
        alertActionSheet.alertController = [UIAlertController alertControllerWithTitle:title message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        if (cancelTitle) {
            [alertActionSheet.alertController addAction:[UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                if (handler) {
                    handler();
                }
            }]];
        }
    }
    
    return alertActionSheet;
}

/*!
 *  @brief 添加 按钮
 */
- (void)addButtonWithTitle:(nullable NSString *)title
                   handler:(nullable dispatch_block_t)handler {
    if (kIHSystemVersionFloatValue < 8.0) {
        if (self.alertView) {
            [self.alertView addButtonWithTitle:title];
        }else {
            [self.actionSheet addButtonWithTitle:title];
        }
        [self.blocks addObject:handler ? handler : ^{}];
    }else {
    if (title) {
        [self.alertController addAction:[UIAlertAction actionWithTitle:title style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (handler) {
                handler();
            }
        }]];
    }
    }
}

/*!
 *  @brief 添加多个按钮
 */
- (void)addButtonWithTitles:(nullable NSArray<NSString *>*)titles
                    handler:(nullable IHAlertActionSheetHandlerBlock)handler {
    [titles enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
    {
        [self addButtonWithTitle:obj handler:^{
            if (handler) {
                handler(idx);
            }
        }];
    }];
}
/*!
 *  @brief show alertSheetView
 */
- (void)show {
    if (kIHSystemVersionFloatValue < 8.0) {
        if (self.alertView) {
            [self.alertView show];
        }else{
            [self.actionSheet showInView:[self _topViewController].view];
        }
    } else {
        [[self _topViewController] presentViewController:self.alertController animated:YES completion:nil];
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    dispatch_block_t block = self.blocks[buttonIndex];
    block();
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    dispatch_block_t block = self.blocks[buttonIndex];
    block();
}

#pragma mark - 私有方法
- (UIViewController *)_topViewController {
    UIViewController *rootViewController = ((UIWindow *)[[[UIApplication sharedApplication] windows] objectAtIndex:0]).rootViewController;
    UIViewController *topViewController = rootViewController;
    while (topViewController.presentedViewController) {
        topViewController = rootViewController.presentedViewController;
    }
    return topViewController;
}
#pragma mark - 事件响应
@end
