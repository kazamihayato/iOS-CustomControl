//
//  TestNSOjectHUD.m
//  MBProgressHUD封装后直接调用
//
//  Created by 庄BB的MacBook on 16/7/25.
//  Copyright © 2016年 BBFC. All rights reserved.
//

#import "TestNSOjectHUD.h"
#import "NSObject+MBProgressHUD.h"
@implementation TestNSOjectHUD

-(void)showHUDWithTitle:(NSString *)title
{
    [self showHUDWindowWithTitle:@"测试NSObject的HUD"];
}
@end
