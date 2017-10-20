//
//  BBAlertView.h
//  AlertViewDemo
//
//  Created by 庄BB的MacBook on 2017/10/17.
//  Copyright © 2017年 BBFC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BBAlertView : UIView
//确认弹框
+(void) showAlertViewWithTitle:(NSString *)title
                       message:(NSString *)message
                  buttonTitles:(NSArray *)btnArr
                  confirmBlock:(dispatch_block_t)confirmBlock;

/**
 左、右点击事件

 @param title 标题描述
 @param message 信息描述
 @param btnArray 按钮title数组（1-2个）
 @param leftBlock 左点击事件
 @param rightBlock 右点击事件
 */
+(void) showAlertViewWithTitle:(NSString*)title
                      message:(NSString*)message
                 buttonTitles:(NSArray*)btnArr
                    leftBlock:(dispatch_block_t)leftBlock
                   rightBlock:(dispatch_block_t)rightBlock;
@end
