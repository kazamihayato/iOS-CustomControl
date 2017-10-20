//
//  ViewController.m
//  AlertViewDemo
//
//  Created by 庄BB的MacBook on 2017/10/17.
//  Copyright © 2017年 BBFC. All rights reserved.
//

#import "ViewController.h"
#import "BBAlertView.h"

#define Titles [NSArray arrayWithObjects:@"单确认",@"左取消 右确认",@"左点击 右点击",nil]

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [Titles enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        UIButton * btn  = [UIButton buttonWithType:UIButtonTypeSystem];
        btn.frame       = CGRectMake(([[UIScreen mainScreen] bounds].size.width-250)/2, 120*(idx+1)+30*idx, 250, 30);
        btn.tag         = 100+idx;
        [btn setTitle :(NSString*)obj forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        
    }];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)btnPressed:(UIButton*)btn
{
    switch (btn.tag-100) {
        case 0:
        {
            [BBAlertView showAlertViewWithTitle:@"提示" message:@"您确认要这么做吗？" buttonTitles:@[@"确认"] confirmBlock:^{
                NSLog(@"已确认");
            }];
        }
            break;
        case 1:
        {
            [BBAlertView showAlertViewWithTitle:@"提示" message:@"您确认要这么做吗？" buttonTitles:@[@"取消",@"确认"] confirmBlock:^{
                NSLog(@"已确认");
            }];
        }
            break;
        case 2:
        {
            [BBAlertView showAlertViewWithTitle:@"提示" message:@"您确定要" buttonTitles:@[@"左点击",@"右点击"] leftBlock:^{
                NSLog(@"左点击");
            } rightBlock:^{
                NSLog(@"右点击");
            }];
        }
            break;
        default:
            break;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
