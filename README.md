# IHAlertSheetView

这是一个对：  
 `UIAlertView`   
 `UIActionSheet`  
 `UIAlertController`  
 3个控件的封装，让我们在使用系统提示框时不在做各种的版本判断和添加各种`tag`
 
 ---
 
## 1、效果图
<p><img src="http://images2015.cnblogs.com/blog/724434/201610/724434-20161008160125442-1675795494.gif" alt="" /></p> 
## 2、使用
 
### 2.1、Alert
    IHAlertActionSheet *alertActionSheet = [IHAlertActionSheet alertWithTitle:@"提示" message:@"MNESS"];
    [alertActionSheet addButtonWithTitle:@"取消" handlerBlock:^{
        [SVProgressHUD showSuccessWithStatus:@"取消"];
    }];
    [alertActionSheet addButtonWithTitle:@"确定" handlerBlock:^{
        [SVProgressHUD showSuccessWithStatus:@"确定"];
    }];
    [alertActionSheet show];
### 2.1、Sheet
    IHAlertActionSheet *alertActionSheet = [IHAlertActionSheet sheetWithTitle:@"分享到以下平台" cancelTitle:@"cancel" handlerBlock:^{
        [SVProgressHUD showSuccessWithStatus:@"cancel"];
    }];
    [alertActionSheet addButtonWithTitle:@"QQ" handlerBlock:^{
        [SVProgressHUD showSuccessWithStatus:@"QQ"];
    }];
    [alertActionSheet addButtonWithTitle:@"WB" handlerBlock:^{
        [SVProgressHUD showSuccessWithStatus:@"WB"];
    }];
    [alertActionSheet show]; 
## 3、API

```
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
```