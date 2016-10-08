//
//  IHAlertSheetView.h
//  IHAlertAction
//
//  Created by ___liangdahong on 16/10/8.
//  Copyright © 2016年 http://idhong.com/. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IHAlertSheettAction.h"

/*!
 本view 主要是为了解决  
 UIAlertView
 UIActionSheet
 UIAlertController
 的使用和版本问题
 全部使用 UIAlertController的回调方式处理
 目前只是实现简单的弹窗功能，其实我们使用它基本是使用最简单的提示框而一
 */

@interface IHAlertSheetView : UIView

/*!
 *  @brief 创建一个 alert
 *
 *  @param title   title
 *  @param message message
 */
+ (instancetype)alertWithTitle:(NSString *)title message:(NSString *)message;

/*!
 *  @brief 创建一个 Sheet
 *
 *  @param title       title
 *  @param message     message
 *  @param cancelTitle 取消按钮的文字
 *  @param handler     取消按钮点击的block
 */
+ (instancetype)sheetWithTitle:(NSString *)title message:(NSString *)message cancelTitle:(NSString *)cancelTitle handler:(dispatch_block_t)handler;

/*!
 *  @brief 为 IHAlertSheetView 添加一个按钮
 *
 *  @param action IHAlertSheettAction 对象
 */
- (void)addAction:(IHAlertSheettAction *)action;

/*!
 *  @brief 为 IHAlertSheetView 添加一组IHAlertSheettAction
 *
 *  @param actions IHAlertSheettAction数组
 */
- (void)addActions:(NSArray <IHAlertSheettAction *>*)actions;

/*!
 *  @brief 显示 IHAlertSheetView
 */
- (void)show;

@end
