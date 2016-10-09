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
<p>&nbsp;</p>
<div class="cnblogs_code">
<pre>    IHAlertSheetView *alertSheetView = [IHAlertSheetView alertWithTitle:<span style="color: #800000;">@"</span><span style="color: #800000;">是否继续此操作？</span><span style="color: #800000;">"</span><span style="color: #000000;"> message:nil];
    [alertSheetView addButtonWithTitle:</span><span style="color: #800000;">@"</span><span style="color: #800000;">确定</span><span style="color: #800000;">"</span> handler:^<span style="color: #000000;">{
        [SVProgressHUD showSuccessWithStatus:</span><span style="color: #800000;">@"</span><span style="color: #800000;">确定</span><span style="color: #800000;">"</span><span style="color: #000000;">];
    }];
    [alertSheetView addButtonWithTitle:</span><span style="color: #800000;">@"</span><span style="color: #800000;">取消</span><span style="color: #800000;">"</span> handler:^<span style="color: #000000;">{
        [SVProgressHUD showSuccessWithStatus:</span><span style="color: #800000;">@"</span><span style="color: #800000;">取消</span><span style="color: #800000;">"</span><span style="color: #000000;">];
    }];
    [alertSheetView show];</span></pre>
</div>
<p>&nbsp;</p>
### 2.1、Sheet
 <div class="cnblogs_code">
<pre>    IHAlertSheetView *alertSheet = [IHAlertSheetView sheetWithTitle:<span style="color: #800000;">@"</span><span style="color: #800000;">分享到以下平台</span><span style="color: #800000;">"</span> message:nil cancelTitle:<span style="color: #800000;">@"</span><span style="color: #800000;">取消</span><span style="color: #800000;">"</span><span style="color: #000000;"> handler:nil];
    [alertSheet addButtonWithTitle:</span><span style="color: #800000;">@"</span><span style="color: #800000;">QQ</span><span style="color: #800000;">"</span> handler:^<span style="color: #000000;">{
        [SVProgressHUD showSuccessWithStatus:</span><span style="color: #800000;">@"</span><span style="color: #800000;">分享到 QQ</span><span style="color: #800000;">"</span><span style="color: #000000;">];
    }];
    [alertSheet addButtonWithTitle:</span><span style="color: #800000;">@"</span><span style="color: #800000;">新浪微博</span><span style="color: #800000;">"</span> handler:^<span style="color: #000000;">{
        [SVProgressHUD showSuccessWithStatus:</span><span style="color: #800000;">@"</span><span style="color: #800000;">分享到 新浪微博</span><span style="color: #800000;">"</span><span style="color: #000000;">];
    }];
    [alertSheet show];</span></pre>
</div>
<p>&nbsp;</p>
 
## 3、API

<div class="cnblogs_code">
<pre><span style="color: #008000;">/*</span><span style="color: #008000;">!
 *  @brief 创建 alert
 </span><span style="color: #008000;">*/</span>
+ (nonnull instancetype)alertWithTitle:(nullable NSString *)title message:(nullable NSString *<span style="color: #000000;">)message;

</span><span style="color: #008000;">/*</span><span style="color: #008000;">!
 *  @brief 创建 sheet
 </span><span style="color: #008000;">*/</span>
+ (nonnull instancetype)sheetWithTitle:(nullable NSString *<span style="color: #000000;">)title
                               message:(nullable NSString </span>*<span style="color: #000000;">)message
                           cancelTitle:(nullable NSString </span>*<span style="color: #000000;">)cancelTitle
                               handler:(nullable dispatch_block_t)handler;
</span><span style="color: #008000;">/*</span><span style="color: #008000;">!
 *  @brief 添加 按钮
 </span><span style="color: #008000;">*/</span>
- (<span style="color: #0000ff;">void</span>)addButtonWithTitle:(nullable NSString *<span style="color: #000000;">)title handler:(nullable dispatch_block_t)handler;
</span>- (<span style="color: #0000ff;">void</span>)addAction:(nullable IHAlertSheettAction *<span style="color: #000000;">)action;

</span><span style="color: #008000;">/*</span><span style="color: #008000;">!
 *  @brief 添加多个按钮
 </span><span style="color: #008000;">*/</span>
- (<span style="color: #0000ff;">void</span>)addButtonWithTitles:(nullable NSArray&lt;NSString *&gt;*<span style="color: #000000;">)titles handler:(nullable IHHandlerBlock)handler;
</span>- (<span style="color: #0000ff;">void</span>)addActions:(nullable NSArray &lt;IHAlertSheettAction *&gt;*<span style="color: #000000;">)actions;

</span><span style="color: #008000;">/*</span><span style="color: #008000;">!
 *  @brief show alertSheetView
 </span><span style="color: #008000;">*/</span>
- (<span style="color: #0000ff;">void</span>)show;</pre>
</div>
<p>&nbsp;</p>