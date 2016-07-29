//
//  ThirdController.m
//  PageViewControllerDemo
//
//  Created by 庄BB的MacBook on 16/7/29.
//  Copyright © 2016年 BBFC. All rights reserved.
//

#import "ThirdController.h"

@implementation ThirdController
-(void)viewDidLoad
{
    [super viewDidLoad];
    UILabel * label=[[UILabel alloc] initWithFrame:CGRectMake(150, 150, 200, 30)];
    label.text=@"这是第三页";
    label.textColor=[UIColor blueColor];
    [self.view addSubview:label];
    
}
@end
