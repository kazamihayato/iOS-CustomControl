//
//  UIViewController+MBProgressHUD.m
//  MBProgressHUD封装后直接调用
//
//  Created by 庄BB的MacBook on 16/7/21.
//  Copyright © 2016年 BBFC. All rights reserved.
//

#import "UIViewController+MBProgressHUD.h"
#import "MBProgressHUD+Category.h"
@implementation UIViewController (MBProgressHUD)
- (void)showLoading
{
    [MBProgressHUD showLoadingInView:self.view];
}

- (void)showLoadingWithTitle:(NSString*)title
{
    [MBProgressHUD showLoadingInView:self.view title:title];
}

- (void)hide
{
    [MBProgressHUD hideHUDInView:self.view];
}

- (void)showHUDWithTitle:(NSString*)title
{
    [MBProgressHUD showHUDInView:self.view title:title];
}
@end
