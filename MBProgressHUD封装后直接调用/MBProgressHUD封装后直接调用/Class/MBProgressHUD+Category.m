//
//  MBProgressHUD+Category.m
//  MBProgressHUD封装后直接调用
//
//  Created by 庄BB的MacBook on 16/7/21.
//  Copyright © 2016年 BBFC. All rights reserved.
//

#import "MBProgressHUD+Category.h"
#define HUDTAG 9999

@implementation MBProgressHUD (Category)

+(void)showLoadingInView:(UIView*)superView
{
    [self showLoadingWithTitle:@"加载中" withSuperView:superView];
}

+(void)showLoadingInView:(UIView *)superView title:(NSString*)title
{
    [self showLoadingWithTitle:title withSuperView:superView];
}


+(void)showHUDInView:(UIView *)superView title:(NSString*)title
{
    [self showHUDWithTitle:title withSuperView:superView afterDelay:2.0];
}


+ (void)showLoadingWithTitle:(NSString *)title withSuperView:(UIView *)view
{
    UIView *showInView = nil;
    if (view) {
        showInView = view;
    }else {
        showInView = [UIApplication sharedApplication].keyWindow;
    }
    [self hideHUDWithView:showInView];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:showInView animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.labelText = title;
    hud.labelColor = [UIColor whiteColor];
    hud.labelFont = [UIFont systemFontOfSize:14];
    hud.removeFromSuperViewOnHide = YES;
    hud.color = [UIColor blackColor];
    hud.tag=HUDTAG;
}



+ (void)showHUDWithTitle:(NSString *)title withSuperView:(UIView *)view afterDelay:(NSTimeInterval)delay
{
    UIView *showInView = nil;
    if (view) {
        showInView = view;
    }else {
        showInView = [UIApplication sharedApplication].keyWindow;
    }
    [self hideHUDWithView:showInView];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:showInView animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.margin = 10;
    hud.labelText = title;
    hud.labelColor = [UIColor whiteColor];
    hud.labelFont = [UIFont systemFontOfSize:14];
    hud.removeFromSuperViewOnHide = YES;
    hud.color = [UIColor blackColor];
    hud.tag=HUDTAG;
    [hud hide:YES afterDelay:delay];

}


+(void)hideHUDWithView:(UIView*)superView
{
    MBProgressHUD *view;
    if (!superView) {
        view = (MBProgressHUD *)[[[UIApplication sharedApplication] keyWindow] viewWithTag:HUDTAG];
    }
    else
    {
        view=(MBProgressHUD *)[superView viewWithTag:HUDTAG];
    }
    [view hide:YES afterDelay:0];
    
}
@end
