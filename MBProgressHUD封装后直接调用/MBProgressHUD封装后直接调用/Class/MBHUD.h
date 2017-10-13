//
//  MBHUD.h
//  MBProgressHUD封装后直接调用
//
//  Created by 庄BB的MacBook on 2017/10/13.
//  Copyright © 2017年 BBFC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MBHUD : UIView

+(void)showLoadingInView:(UIView*)view;

+(void)showLoadingInView:(UIView*)view title:(NSString*)title;

+(void)showLoadingInView:(UIView*)view title:(NSString*)title delay:(NSTimeInterval)delay;

+(void)showHUDWithTitle:(NSString*)title InView:(UIView*)view;

+(void)hideHUDInView:(UIView*)view;

@end
