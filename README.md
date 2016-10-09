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
 ```
    IHAlertSheetView *alertSheetView = [IHAlertSheetView alertWithTitle:@"是否继续此操作？" message:nil];
    [alertSheetView addButtonWithTitle:@"确定" handler:^{
        [SVProgressHUD showSuccessWithStatus:@"确定"];
    }];
    [alertSheetView addButtonWithTitle:@"取消" handler:^{
        [SVProgressHUD showSuccessWithStatus:@"取消"];
    }];
    [alertSheetView show];
```
### 2.1、Sheet
```
    IHAlertSheetView *alertSheet = [IHAlertSheetView sheetWithTitle:@"分享到以下平台" message:nil cancelTitle:@"取消" handler:nil];
    [alertSheet addButtonWithTitle:@"QQ" handler:^{
        [SVProgressHUD showSuccessWithStatus:@"分享到 QQ"];
    }];
    [alertSheet addButtonWithTitle:@"新浪微博" handler:^{
        [SVProgressHUD showSuccessWithStatus:@"分享到 新浪微博"];
    }];
    [alertSheet show];
```
## 3、API
   <p><img src="http://images2015.cnblogs.com/blog/724434/201610/724434-20161008153831114-623641417.png" alt="" /></p>


