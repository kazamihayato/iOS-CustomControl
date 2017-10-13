//
//  MBHUD.m
//  MBProgressHUD封装后直接调用
//
//  Created by 庄BB的MacBook on 2017/10/13.
//  Copyright © 2017年 BBFC. All rights reserved.
//

#import "MBHUD.h"
#import "MBProgressHUD.h"


static const NSInteger MBHUDView_tag=1980;

@implementation MBHUD

+(void)showLoadingInView:(UIView *)view
{
    [self showLoadingInView:view title:nil delay:0];
}

+(void)showLoadingInView:(UIView *)view title:(NSString *)title
{
    [self showLoadingInView:view title:title delay:0];
}

+(void)showLoadingInView:(UIView*)view title:(NSString*)title delay:(NSTimeInterval)delay
{
    UIView *showInView = nil;
    if (view) {
        showInView = view;
    }else {
        showInView = [UIApplication sharedApplication].keyWindow;
    }
    [self hideHUDInView:view];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:showInView animated:YES];
    hud.mode           = MBProgressHUDModeIndeterminate;
    hud.labelText      = !title?@"加载中":title;
    hud.labelColor     = [UIColor whiteColor];
    hud.labelFont      = [UIFont systemFontOfSize:14];
    hud.tag            = MBHUDView_tag;
    if (delay>0) {
        [hud hide:YES afterDelay:delay];
    }
}

+(void)showHUDWithTitle:(NSString*)title InView:(UIView*)view
{
    [self showHUDWithTitle:title InView:view delay:1.5];
}

+(void)showHUDWithTitle:(NSString*)title InView:(UIView*)view delay:(NSTimeInterval)delay
{
    UIView *showInView = nil;
    if (view) {
        showInView = view;
    }else {
        showInView = [UIApplication sharedApplication].keyWindow;
    }
    [self hideHUDInView:view];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:showInView animated:YES];
    hud.mode       = MBProgressHUDModeText;
    hud.margin     = 10;
    hud.labelText  = title;
    hud.labelColor = [UIColor whiteColor];
    hud.labelFont  = [UIFont systemFontOfSize:14];
    hud.removeFromSuperViewOnHide = YES;
    hud.tag        = MBHUDView_tag;
    [hud hide:YES afterDelay:delay];
}

+(void)hideHUDInView:(UIView*)view
{
    UIView *showInView = nil;
    if (view) {
        showInView = view;
    }else {
        showInView = [UIApplication sharedApplication].keyWindow;
    }
    MBProgressHUD *hud = [view viewWithTag:MBHUDView_tag];
    if(hud)
    {
        [hud hide:YES];
    }
}


@end
