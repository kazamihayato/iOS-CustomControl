//
//  CommonPageViewController.m
//  PageViewControllerDemo
//
//  Created by 庄BB的MacBook on 16/7/29.
//  Copyright © 2016年 BBFC. All rights reserved.
//

#import "CommonPageViewController.h"
#import "FirstController.h"
#import "SecondController.h"
#import "ThirdController.h"

@implementation CommonPageViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
}

-(void)constructData
{
    self.controllers=@[[self createHomePageControllerWith:[FirstController class]],
                       [self createHomePageControllerWith:[SecondController class]],
                       [self createHomePageControllerWith:[ThirdController class]]];
}

-(void)configSegment
{
    self.titles=@[@"第一页",@"第二页",@"第三页"];
    
    self.titleTextAttributes=@{NSForegroundColorAttributeName:[UIColor blackColor], NSFontAttributeName:[UIFont systemFontOfSize:13]};
    
    self.selectedTitleTextAttributes=@{NSForegroundColorAttributeName:[UIColor redColor], NSFontAttributeName:[UIFont systemFontOfSize:13]};
}

@end
