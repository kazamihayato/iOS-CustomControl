//
//  UIViewController+MBProgressHUD.m
//  MBProgressHUD封装后直接调用
//
//  Created by 庄BB的MacBook on 16/7/21.
//  Copyright © 2016年 BBFC. All rights reserved.
//

#import "UIViewController+MBProgressHUD.h"
#import "MBHUD.h"
@implementation UIViewController (MBProgressHUD)
- (void)showLoading
{
    [MBHUD showLoadingInView:self.view];
}

- (void)showLoadingWithTitle:(NSString*)title
{
    [MBHUD showLoadingInView:self.view title:title];
}

- (void)showLoadingWithTitle:(NSString *)title delay:(NSTimeInterval)delay
{
    [MBHUD showLoadingInView:self.view title:title delay:delay];
}

- (void)hide
{
    [MBHUD hideHUDInView:self.view];
}

- (void)showHUDWithTitle:(NSString*)title
{
    [MBHUD showHUDWithTitle:title InView:self.view];
}
@end
