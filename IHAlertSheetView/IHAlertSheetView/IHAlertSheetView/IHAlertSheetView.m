//
//  IHAlertSheetView.m
//  IHAlertAction
//
//  Created by ___liangdahong on 16/10/8.
//  Copyright © 2016年 http://idhong.com/. All rights reserved.
//

#import "IHAlertSheetView.h"

#define kSystemVersionFloatValue     [[[UIDevice currentDevice] systemVersion] floatValue]
#define kOS_VERSION_MIN_REQUIRED_7_0  __IPHONE_OS_VERSION_MIN_REQUIRED < 80000

@interface IHAlertSheetView ()
#if kOS_VERSION_MIN_REQUIRED_7_0
<UIAlertViewDelegate, UIActionSheetDelegate>
@property (nonatomic, strong) UIAlertView *alertView;
@property (nonatomic, strong) UIActionSheet *actionSheet;
@property (nonatomic, strong) NSMutableArray *blocks;
#endif
@property (nonatomic, strong) UIAlertController *alertController;

@end

@implementation IHAlertSheetView

#pragma mark -
#pragma mark - init

#pragma mark - 公有方法
+ (instancetype)alertWithTitle:(NSString *)title message:(NSString *)message {
    IHAlertSheetView *alertSheet = [IHAlertSheetView new];
#if kOS_VERSION_MIN_REQUIRED_7_0
    if (kSystemVersionFloatValue < 8.0) {
        alertSheet.alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:alertSheet cancelButtonTitle:nil otherButtonTitles:nil, nil];
    }
    else {
        alertSheet.alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:1];
    }
#else
    alertSheet.alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:1];
#endif
    return alertSheet;
}

+ (instancetype)sheetWithTitle:(NSString *)title message:(NSString *)message cancelTitle:(NSString *)cancelTitle handler:(dispatch_block_t)handler {
    IHAlertSheetView *alertSheet = [IHAlertSheetView new];
#if kOS_VERSION_MIN_REQUIRED_7_0
    alertSheet.alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:0];
    if (kSystemVersionFloatValue < 8.0) {
        alertSheet.actionSheet = [[UIActionSheet alloc] initWithTitle:title delegate:alertSheet cancelButtonTitle:cancelTitle destructiveButtonTitle:nil otherButtonTitles:nil, nil];
        if (cancelTitle) {
            if (handler) {
                [alertSheet.blocks addObject:handler];
            }else{
                [alertSheet.blocks addObject:^{}];
            }
        }
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
#else
    alertSheet.alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:0];
    if (cancelTitle) {
        UIAlertAction *alertAction = [UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction *actio) {
            if (handler) {
                handler();
            }
        }];
        [alertSheet.alertController addAction:alertAction];
    }
#endif
    return alertSheet;
}

- (void)addAction:(IHAlertSheettAction *)action {
    
#if kOS_VERSION_MIN_REQUIRED_7_0
    if (kSystemVersionFloatValue < 8.0) {
        if (self.alertView) {
            [self.alertView addButtonWithTitle:action.title];
            [self.blocks addObject:action.handlerBlock];
        }else{
            [self.actionSheet addButtonWithTitle:action.title];
            [self.blocks addObject:action.handlerBlock];
        }
    }else{
        UIAlertAction *alertAction = [UIAlertAction actionWithTitle:action.title style:UIAlertActionStyleDefault handler:^(UIAlertAction *actio) {
            if (action.handlerBlock) {
                action.handlerBlock();
            }
        }];
        [self.alertController addAction:alertAction];
    }
#else
    UIAlertAction *alertAction = [UIAlertAction actionWithTitle:action.title style:UIAlertActionStyleDefault handler:^(UIAlertAction *actio) {
        if (action.handlerBlock) {
            action.handlerBlock();
        }
    }];
    [self.alertController addAction:alertAction];
#endif
}

- (void)addActions:(NSArray <IHAlertSheettAction *>*)actions {
    [actions enumerateObjectsUsingBlock:^(IHAlertSheettAction * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self addAction:obj];
    }];
}

- (void)show {
#if kOS_VERSION_MIN_REQUIRED_7_0
    if (kSystemVersionFloatValue < 8.0) {
        if (self.alertView) {
            [self.alertView show];
        }else{
            [self.actionSheet showInView:[self _topViewController].view];
        }
    } else {
        [[self _topViewController] presentViewController:self.alertController animated:YES completion:nil];
    }
#else
    [[self _topViewController] presentViewController:self.alertController animated:YES completion:nil];
#endif
}

#if kOS_VERSION_MIN_REQUIRED_7_0
- (NSMutableArray *)blocks {
    if (!_blocks) {
        _blocks = [@[] mutableCopy];
    }
    return _blocks;
}
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
