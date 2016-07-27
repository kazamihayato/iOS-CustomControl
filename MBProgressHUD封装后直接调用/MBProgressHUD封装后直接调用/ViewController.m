//
//  ViewController.m
//  MBProgressHUD类别分装
//
//  Created by 庄BB的MacBook on 16/7/25.
//  Copyright © 2016年 BBFC. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+MBProgressHUD.h"
#import "TestHUD.h"


#define Titles [NSArray arrayWithObjects:@"模拟请求过程中的HUD",@"NSObject的显示文字",nil]
#define SCREEN_WIDTH                 [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT                [[UIScreen mainScreen] bounds].size.height

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [Titles enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        UIButton * btn  = [UIButton buttonWithType:UIButtonTypeSystem];
        btn.frame       = CGRectMake((SCREEN_WIDTH-250)/2, 120*(idx+1)+30*idx, 250, 30);
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
            [TestHUD testHUDLoadingBLock:^{
                [self showHUDWithTitle:@"加载成功！"];
            }];
        }
            break;
        case 1:
        {
            [[[TestHUD alloc] init] showHUDWithTitle:@"显示文字"];
        }
        default:
            break;
    }
}

-(void)loadData
{
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
