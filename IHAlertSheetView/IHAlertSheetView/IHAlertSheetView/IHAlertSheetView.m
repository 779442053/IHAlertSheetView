//
//  IHAlertSheetView.m
//  IHAlertAction
//
//  Created by ___liangdahong on 16/10/8.
//  Copyright © 2016年 http://idhong.com/. All rights reserved.
//

#import "IHAlertSheetView.h"

#define kSystemVersionFloatValue      [[[UIDevice currentDevice] systemVersion] floatValue]
#define k__IPHONE_OS_VERSION_MIN_REQUIRED_7_0_  __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_8_0

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

#pragma mark -

#pragma mark -

@interface IHAlertSheetView ()
#if k__IPHONE_OS_VERSION_MIN_REQUIRED_7_0_
<UIAlertViewDelegate, UIActionSheetDelegate>
@property (nonatomic, strong) UIAlertView *alertView;
@property (nonatomic, strong) UIActionSheet *actionSheet;
#endif
@property (nonatomic, strong) NSMutableArray *blocks;
@property (nonatomic, strong) UIAlertController *alertController;


@end

@implementation IHAlertSheetView

#pragma mark -
#pragma mark - init

- (NSMutableArray *)blocks {
    if (!_blocks) {
        _blocks = [@[] mutableCopy];
    }
    return _blocks;
}
#pragma mark - 公有方法
+ (instancetype)alertWithTitle:(NSString *)title message:(NSString *)message {
    IHAlertSheetView *alertSheet = [IHAlertSheetView new];
    if (kSystemVersionFloatValue < 8.0) {
#if k__IPHONE_OS_VERSION_MIN_REQUIRED_7_0_
        alertSheet.alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:alertSheet cancelButtonTitle:nil otherButtonTitles:nil, nil];
#endif
    }
    else {
        alertSheet.alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:1];
    }
    return alertSheet;
}

+ (instancetype)sheetWithTitle:(NSString *)title message:(NSString *)message cancelTitle:(NSString *)cancelTitle handler:(dispatch_block_t)handler {
    IHAlertSheetView *alertSheet = [IHAlertSheetView new];
    alertSheet.alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:0];
    if (kSystemVersionFloatValue < 8.0) {
#if k__IPHONE_OS_VERSION_MIN_REQUIRED_7_0_
        alertSheet.actionSheet = [[UIActionSheet alloc] initWithTitle:title delegate:alertSheet cancelButtonTitle:cancelTitle destructiveButtonTitle:nil otherButtonTitles:nil, nil];
        if (cancelTitle) {
            if (handler) {
                [alertSheet.blocks addObject:handler];
            }else{
                [alertSheet.blocks addObject:^{}];
            }
        }
#endif
    } else {
        if (cancelTitle) {
            UIAlertAction *alertAction = [UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction *actio) {
                if (handler) {
                    handler();
                }
            }];
            [alertSheet.alertController addAction:alertAction];
        }
    }
    return alertSheet;
}

- (void)addAction:(IHAlertSheettAction *)action {
    if (kSystemVersionFloatValue < 8.0) {
#if k__IPHONE_OS_VERSION_MIN_REQUIRED_7_0_
        if (self.alertView) {
            [self.alertView addButtonWithTitle:action.title];
            [self.blocks addObject:action.handlerBlock];
        }else{
            [self.actionSheet addButtonWithTitle:action.title];
            [self.blocks addObject:action.handlerBlock];
        }
#endif
    }else{
        UIAlertAction *alertAction = [UIAlertAction actionWithTitle:action.title style:UIAlertActionStyleDefault handler:^(UIAlertAction *actio) {
            if (action.handlerBlock) {
                action.handlerBlock();
            }
        }];
        [self.alertController addAction:alertAction];
    }
}

- (void)addActions:(NSArray <IHAlertSheettAction *>*)actions {
    [actions enumerateObjectsUsingBlock:^(IHAlertSheettAction * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self addAction:obj];
    }];
}

- (void)show {
    if (kSystemVersionFloatValue < 8.0) {
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

- (void)addButtonWithTitle:(NSString *)title handler:(dispatch_block_t)handler {
    [self addAction:[IHAlertSheettAction alertSheettActionWithTitle:title handler:handler]];
}

- (void)addButtonWithTitles:(NSArray<NSString *> *)titles handler:(IHHandlerBlock)handler {
    [titles enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self addAction:[IHAlertSheettAction alertSheettActionWithTitle:obj handler:^{
            if (handler) {
                handler(idx);
            }
        }]];
    }];
}
#if k__IPHONE_OS_VERSION_MIN_REQUIRED_7_0_
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    dispatch_block_t block = self.blocks[buttonIndex];
    block();
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    dispatch_block_t block = self.blocks[buttonIndex];
    block();
}
#endif

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
