//
//  ViewController.m
//  TopViewDemo
//
//  Created by 庄BB的MacBook on 2017/10/20.
//  Copyright © 2017年 BBFC. All rights reserved.
//

#import "ViewController.h"
#import "BBTopView.h"

#define Titles [NSArray arrayWithObjects:@"成功",@"失败",@"警告",nil]


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

-(void)btnPressed:(UIButton*)btn
{
    switch (btn.tag-100) {
        case 0:
        {
            [BBTopView showTopSuccess:@"发布成功"];
        }
            break;
        case 1:
        {
            [BBTopView showTopFailed:@"发布失败"];
        }
            break;
        case 2:
        {
            [BBTopView showTopWarning:@"网络似乎出了点状况"];
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
