//
//  NSObject+MBProgressHUD.h
//  MBProgressHUD封装后直接调用
//
//  Created by 庄BB的MacBook on 16/7/21.
//  Copyright © 2016年 BBFC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (MBProgressHUD)

- (void)hide;

- (void)showHUDWindowWithTitle:(NSString*)title;
@end
