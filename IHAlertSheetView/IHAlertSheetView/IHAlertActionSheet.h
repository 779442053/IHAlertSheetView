//
//  IHAlertActionSheet.h
//  IHAlertSheetView
//
//  Created by __liangdahong on 16/10/10.
//  Copyright © 2016年 http://idhong.com/. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^IHAlertActionSheetHandlerBlock)(NSInteger index);

@interface IHAlertActionSheet : UIView

/*!
 *  @brief 创建 alert
 */
- (nonnull instancetype)initWithTitle:(nullable NSString *)title
                              message:(nullable NSString *)message;

/*!
 *  @brief 创建 sheet
 */
+ (nonnull instancetype)sheetWithTitle:(nullable NSString *)title
                           cancelTitle:(nullable NSString *)cancelTitle
                               handler:(nullable dispatch_block_t)handler;
/*!
 *  @brief 添加 按钮
 */
- (void)addButtonWithTitle:(nullable NSString *)title
                   handler:(nullable dispatch_block_t)handler;

/*!
 *  @brief 添加多个按钮
 */
- (void)addButtonWithTitles:(nullable NSArray<NSString *>*)titles
                    handler:(nullable IHAlertActionSheetHandlerBlock)handler;
/*!
 *  @brief show alertSheetView
 */
- (void)show;

@end
