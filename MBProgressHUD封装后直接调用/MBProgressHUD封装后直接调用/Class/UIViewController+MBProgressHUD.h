//
//  UIViewController+MBProgressHUD.h
//  MBProgressHUD封装后直接调用
//
//  Created by 庄BB的MacBook on 16/7/21.
//  Copyright © 2016年 BBFC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (MBProgressHUD)

- (void)showLoading;

- (void)showLoadingWithTitle:(NSString*)title;

- (void)hide;

- (void)showHUDWithTitle:(NSString*)title;

@end
