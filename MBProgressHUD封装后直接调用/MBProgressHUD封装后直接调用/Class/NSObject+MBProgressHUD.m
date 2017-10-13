//
//  NSObject+MBProgressHUD.m
//  MBProgressHUD封装后直接调用
//
//  Created by 庄BB的MacBook on 16/7/21.
//  Copyright © 2016年 BBFC. All rights reserved.
//

#import "NSObject+MBProgressHUD.h"
#import "MBHUD.h"
@implementation NSObject (MBProgressHUD)

- (void)hide
{
    [MBHUD hideHUDInView:nil];
}

- (void)showHUDWindowWithTitle:(NSString*)title
{
    [MBHUD showHUDWithTitle:title InView:nil];
}
@end
