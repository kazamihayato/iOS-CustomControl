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

- (void) constructData;

- (void) configSegment;

- (void) selectPageWith:(NSInteger)index;

- (BaseViewController*)createHomePageControllerWith:(Class)Controller;
@end
