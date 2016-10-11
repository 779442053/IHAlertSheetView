//
//  IHAlertActionSheet.m
//  IHAlertActionSheet
//
//  Created by ___liangdahong on 16/10/11.
//  Copyright © 2016年 http://idhong.com/. All rights reserved.
//

#import "IHAlertActionSheet.h"
#import <objc/runtime.h>
#import <UIKit/UIKit.h>

#define kIHSystemVersionFloatValue              [[[UIDevice currentDevice] systemVersion] floatValue]
#define k__IPHONE_OS_VERSION_MIN_REQUIRED_7_0_  __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_8_0

@interface IHAlertActionSheet ()

#if k__IPHONE_OS_VERSION_MIN_REQUIRED_7_0_
<UIAlertViewDelegate, UIActionSheetDelegate>
@property (nonatomic, strong) UIAlertView *alertView;
@property (nonatomic, strong) UIActionSheet *actionSheet;
#endif
@property (nonatomic, strong) NSMutableArray <dispatch_block_t> *blocks;
@property (nonatomic, strong) UIAlertController *alertController;

@end

@implementation IHAlertActionSheet

#pragma mark -

#pragma mark - init

#pragma mark - getters setters

- (NSMutableArray<dispatch_block_t> *)blocks {
    if (!_blocks) {
        _blocks = [@[] mutableCopy];
    }
    return _blocks;
}

#pragma mark - 系统delegate

#if k__IPHONE_OS_VERSION_MIN_REQUIRED_7_0_
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    dispatch_block_t block = self.blocks[buttonIndex];
    block();
    objc_setAssociatedObject([UIApplication sharedApplication], @selector(alertWithTitle:message:), nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    dispatch_block_t block = self.blocks[buttonIndex];
    block();
    objc_setAssociatedObject([UIApplication sharedApplication], @selector(sheetWithTitle:cancelTitle:handlerBlock:), nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
#endif

#pragma mark - 自定义delegate

#pragma mark - 公有方法
+ (nonnull instancetype)alertWithTitle:(nullable NSString *)title
                               message:(nullable NSString *)message {
    if (objc_getAssociatedObject([UIApplication sharedApplication], _cmd)
        || objc_getAssociatedObject([UIApplication sharedApplication], @selector(sheetWithTitle:cancelTitle:handlerBlock:))) {
        return nil;
    }
    IHAlertActionSheet *alert = [self new];
    objc_setAssociatedObject([UIApplication sharedApplication], _cmd, alert, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (kIHSystemVersionFloatValue < 8.0) {
#if k__IPHONE_OS_VERSION_MIN_REQUIRED_7_0_
        alert.alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:alert cancelButtonTitle:nil otherButtonTitles:nil, nil];
#endif
    }else {
        alert.alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    }
    return alert;
}

+ (nonnull instancetype)sheetWithTitle:(nullable NSString *)title
                           cancelTitle:(nullable NSString *)cancelTitle
                          handlerBlock:(nullable dispatch_block_t)handlerBlock {
    if (objc_getAssociatedObject([UIApplication sharedApplication], @selector(alertWithTitle:message:))
        || objc_getAssociatedObject([UIApplication sharedApplication], _cmd)) {
        return nil;
    }
    IHAlertActionSheet *actionSheet = [self new];
    objc_setAssociatedObject([UIApplication sharedApplication], _cmd, actionSheet, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (kIHSystemVersionFloatValue < 8.0) {
#if k__IPHONE_OS_VERSION_MIN_REQUIRED_7_0_
        actionSheet.actionSheet = [[UIActionSheet alloc] initWithTitle:title delegate:actionSheet cancelButtonTitle:cancelTitle destructiveButtonTitle:nil otherButtonTitles:nil, nil];
        if (cancelTitle) {
            [actionSheet.blocks addObject: handlerBlock ? handlerBlock : ^{}];
        }
#endif
    }else {
        actionSheet.alertController = [UIAlertController alertControllerWithTitle:title message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        if (cancelTitle) {
            [actionSheet.alertController addAction:[UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                objc_setAssociatedObject([UIApplication sharedApplication], @selector(alertWithTitle:message:), nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
                objc_setAssociatedObject([UIApplication sharedApplication], @selector(sheetWithTitle:cancelTitle:handlerBlock:), nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
                if (handlerBlock) {
                    handlerBlock();
                }
            }]];
        }
    }
    return actionSheet;
}

- (void)addButtonWithTitle:(nullable NSString *)title
              handlerBlock:(nullable dispatch_block_t)handlerBlock {
    if (kIHSystemVersionFloatValue < 8.0) {
#if k__IPHONE_OS_VERSION_MIN_REQUIRED_7_0_
        if (self.alertView) {
            [self.alertView addButtonWithTitle:title];
        }else {
            [self.actionSheet addButtonWithTitle:title];
        }
        [self.blocks addObject:handlerBlock ? handlerBlock : ^{}];
#endif
    } else {
        if (title) {
            [self.alertController addAction:[UIAlertAction actionWithTitle:title style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                objc_setAssociatedObject([UIApplication sharedApplication], @selector(alertWithTitle:message:), nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
                objc_setAssociatedObject([UIApplication sharedApplication], @selector(sheetWithTitle:cancelTitle:handlerBlock:), nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
                if (handlerBlock) {
                    handlerBlock();
                }
            }]];
        }
    }
}

- (void)addButtonWithTitles:(nullable NSArray<NSString *>*)titles
               handlerBlock:(nullable IHAlertActionSheetHandlerBlock)handlerBlock {
    [titles enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
     {
         [self addButtonWithTitle:obj handlerBlock:^{
             if (handlerBlock) {
                 handlerBlock(idx);
             }
         }];
     }];
}

- (void)show {
    if (kIHSystemVersionFloatValue < 8.0) {
#if k__IPHONE_OS_VERSION_MIN_REQUIRED_7_0_
        if (self.alertView) {
            [self.alertView show];
        }else{
            [self.actionSheet showInView:[self _topViewController].view];
        }
#endif
    } else {
        [[self _topViewController] presentViewController:self.alertController animated:YES completion:nil];
    }
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
