//
//  IHAlertActionSheet.h
//  IHAlertActionSheet
//
//  Created by ___liangdahong on 16/10/11.
//  Copyright © 2016年 http://idhong.com/. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^IHAlertActionSheetHandlerBlock)(NSInteger index);

@interface IHAlertActionSheet : NSObject

/*!
 *  @brief creat alert
 *
 *  @param title   title
 *  @param message message
 */
+ (nonnull instancetype)alertWithTitle:(nullable NSString *)title
                               message:(nullable NSString *)message;

/*!
 *  @brief creat alert sheet
 *
 *  @param title        title
 *  @param cancelTitle  cancelTitle
 *  @param handlerBlock handlerBlock
 */
+ (nonnull instancetype)sheetWithTitle:(nullable NSString *)title
                           cancelTitle:(nullable NSString *)cancelTitle
                          handlerBlock:(nullable dispatch_block_t)handlerBlock;

/*!
 *  @brief add Button
 *
 *  @param title        title
 *  @param handlerBlock handlerBlock
 */
- (void)addButtonWithTitle:(nullable NSString *)title
              handlerBlock:(nullable dispatch_block_t)handlerBlock;

/*!
 *  @brief add Buttons
 *
 *  @param titles       titles
 *  @param handlerBlock handlerBlock
 */
- (void)addButtonWithTitles:(nullable NSArray<NSString *>*)titles
               handlerBlock:(nullable IHAlertActionSheetHandlerBlock)handlerBlock;

/*!
 *  @brief show alertActionSheet
 */
- (void)show;

@end