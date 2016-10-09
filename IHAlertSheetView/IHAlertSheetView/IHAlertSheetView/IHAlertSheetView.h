//
//  IHAlertSheetView.h
//  IHAlertAction
//
//  Created by ___liangdahong on 16/10/8.
//  Copyright © 2016年 http://idhong.com/. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IHAlertSheettAction : NSObject

@property (nonatomic, copy, readonly, nullable) NSString *title;

@property (nonatomic, copy, readonly, nullable) dispatch_block_t handlerBlock;

+ (nonnull instancetype)alertSheettActionWithTitle:(nullable NSString *)title handler:(nullable dispatch_block_t)handler;

@end

typedef void(^IHHandlerBlock)(NSInteger index);


@interface IHAlertSheetView : UIView

/*!
 *  @brief 创建 alert
 */
+ (nonnull instancetype)alertWithTitle:(nullable NSString *)title message:(nullable NSString *)message;

/*!
 *  @brief 创建 sheet
 */
+ (nonnull instancetype)sheetWithTitle:(nullable NSString *)title
                               message:(nullable NSString *)message
                           cancelTitle:(nullable NSString *)cancelTitle
                               handler:(nullable dispatch_block_t)handler;
/*!
 *  @brief 添加 按钮
 */
- (void)addButtonWithTitle:(nullable NSString *)title handler:(nullable dispatch_block_t)handler;
- (void)addAction:(nullable IHAlertSheettAction *)action;

/*!
 *  @brief 添加多个按钮
 */
- (void)addButtonWithTitles:(nullable NSArray<NSString *>*)titles handler:(nullable IHHandlerBlock)handler;
- (void)addActions:(nullable NSArray <IHAlertSheettAction *>*)actions;

/*!
 *  @brief show alertSheetView
 */
- (void)show;

@end
