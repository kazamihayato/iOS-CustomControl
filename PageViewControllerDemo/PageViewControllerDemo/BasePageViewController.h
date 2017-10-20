//
//  BasePageViewController.h
//  PageViewControllerDemo
//
//  Created by 庄BB的MacBook on 16/7/29.
//  Copyright © 2016年 BBFC. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BaseViewController;
@interface BasePageViewController : UIViewController
@property(nonatomic,strong)NSArray              * titles;
@property(nonatomic,strong)NSArray              * controllers;
@property(nonatomic,strong)NSDictionary         * titleTextAttributes;
@property(nonatomic,strong)NSDictionary         * selectedTitleTextAttributes;
@property(nonatomic,assign)NSInteger              boardType;

- (instancetype)initWithPageViewFrame:(CGRect)frame;
/**
   添加分页
 */
- (void) constructData;
/**
   设置标题栏属性
 */
- (void) configSegment;

/**
 跳转至某页
 @param index 
 */
- (void) selectPageWith:(NSInteger)index;

/**
 初始化分页的方法，可自行调整，但要注意page属性
 @param Controller 具体页面
 @return <#return value description#>
 */
- (BaseViewController*)createHomePageControllerWith:(Class)Controller;
@end
