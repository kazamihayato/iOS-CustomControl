//
//  FirstController.m
//  PageViewControllerDemo
//
//  Created by 庄BB的MacBook on 16/7/29.
//  Copyright © 2016年 BBFC. All rights reserved.
//

#import "FirstController.h"

@implementation FirstController
-(void)viewDidLoad
{
    [super viewDidLoad];
    UILabel * label=[[UILabel alloc] initWithFrame:CGRectMake(150, 150, 200, 30)];
    label.text=@"这是第一页";
    label.textColor=[UIColor blueColor];
    [self.view addSubview:label];
    
}
@end
