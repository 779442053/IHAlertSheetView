//
//  IHAlertSheetView.h
//  IHAlertAction
//
//  Created by ___liangdahong on 16/10/8.
//  Copyright © 2016年 http://idhong.com/. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IHAlertSheettAction : NSObject

@property (nonatomic, copy, readonly) NSString *title;

@property (nonatomic, copy, readonly) dispatch_block_t handlerBlock;

+ (instancetype)alertSheettActionWithTitle:(NSString *)title handler:(dispatch_block_t)handler;

@end

typedef void(^IHHandlerBlock)(NSInteger index);


@interface IHAlertSheetView : UIView

/*!
 *  @brief 创建 alert
 */
+ (instancetype)alertWithTitle:(NSString *)title message:(NSString *)message;

/*!
 *  @brief 创建 sheet
 */
+ (instancetype)sheetWithTitle:(NSString *)title message:(NSString *)message cancelTitle:(NSString *)cancelTitle handler:(dispatch_block_t)handler;

/*!
 *  @brief 添加 按钮
 */
- (void)addAction:(IHAlertSheettAction *)action;
- (void)addButtonWithTitle:(NSString *)title handler:(dispatch_block_t)handler;

/*!
 *  @brief 添加多个按钮
 */
- (void)addActions:(NSArray <IHAlertSheettAction *>*)actions;
- (void)addButtonWithTitles:(NSArray<NSString *>*)titles handler:(IHHandlerBlock)handler;

/*!
 *  @brief show alertSheetView
 */
- (void)show;

@end
