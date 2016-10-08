# IHAlertSheetView

这是一个对：  
 `UIAlertView`   
 `UIActionSheet`  
 `UIAlertController`  
 3个控件的封装，让我们在使用系统提示框时不在做各种的版本判断和添加各种`tag`
 
 ---
 
## 1、效果图

 
## 2、使用
 
### 2.1、Alert
 
     IHAlertSheetView *alertSheet = [IHAlertSheetView alertWithTitle:@"温馨提示" message:nil];
    [alertSheet addAction:[IHAlertSheettAction alertSheettActionWithTitle:@"OK" handler:^{
        NSLog(@"OK");
    }]];
    [alertSheet addAction:[IHAlertSheettAction alertSheettActionWithTitle:@"CANCEL" handler:^{
        NSLog(@"CANCEL");
    }]];
    [alertSheet show];
    
### 2.1、Sheet
	IHAlertSheetView *alertSheet = [IHAlertSheetView sheetWithTitle:@"温馨提示" message:nil cancelTitle: nil  handler:^{
        NSLog(@"cencel");
    }];
    [alertSheet addAction:[IHAlertSheettAction alertSheettActionWithTitle:@"OK" handler:^{
        NSLog(@"OK");
    }]];
    [alertSheet addAction:[IHAlertSheettAction alertSheettActionWithTitle:@"CANCEL" handler:^{
        NSLog(@"CANCEL");
    }]];
    [alertSheet show];
    
## 3、API
   <p><img src="http://images2015.cnblogs.com/blog/724434/201610/724434-20161008153831114-623641417.png" alt="" /></p>


