//
//  ViewController.m
//  MBProgressHUD封装后直接调用
//
//  Created by 庄BB的MacBook on 16/7/21.
//  Copyright © 2016年 BBFC. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+MBProgressHUD.h"
#import "TestNSOjectHUD.h"


#define Titles [NSArray arrayWithObjects:@"视图控制器的加载中",@"视图控制器的显示文字",@"NSObject的显示文字",nil]
#define SCREEN_WIDTH                 [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT                [[UIScreen mainScreen] bounds].size.height

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [Titles enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        UIButton * btn  = [UIButton buttonWithType:UIButtonTypeSystem];
        btn.frame       = CGRectMake((SCREEN_WIDTH-250)/2, 30*(idx+1)+30*idx, 250, 30);
        btn.tag         = 100+idx;
        [btn setTitle :(NSString*)obj forState:UIControlStateNormal];
        
        [btn addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:btn];
        
    }];
}

-(void)btnPressed:(UIButton*)btn
{
    switch (btn.tag-100) {
            
        //加在视图控制View上，用户扔可以点击返回
        case 0:
        {
            [self showLoading];
        }
            break;
        case 1:
        {
            [self showHUDWithTitle:@"显示文字"];
        }
            break;
        //NSObject相关类调用，加在keywindow上
        case 2:
        {
            [[[TestNSOjectHUD alloc] init] showHUDWithTitle:@"显示文字"];
        }
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
