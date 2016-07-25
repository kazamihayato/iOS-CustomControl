//
//  MBProgressHUD+Category.h
//  MBProgressHUD封装后直接调用
//
//  Created by 庄BB的MacBook on 16/7/21.
//  Copyright © 2016年 BBFC. All rights reserved.
//

#import <MBProgressHUD/MBProgressHUD.h>

@interface MBProgressHUD (Category)

+(void)showLoadingInView:(UIView*)superView;

+(void)showLoadingInView:(UIView *)superView title:(NSString*)title;

+(void)showHUDInView:(UIView *)superView title:(NSString*)title;


+(void)hideHUDInView:(UIView*)superView;


@end
