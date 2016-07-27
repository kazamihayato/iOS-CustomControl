//
//  TestHUD.m
//  MBProgressHUD类别分装
//
//  Created by 庄BB的MacBook on 16/7/25.
//  Copyright © 2016年 BBFC. All rights reserved.
//

#import "TestHUD.h"
#import "NSObject+MBProgressHUD.h"

@implementation TestHUD


+(void)testHUDLoadingBLock:(dispatch_block_t)successBlock
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        successBlock();
        
        
    });
}


-(void)showHUDWithTitle:(NSString *)title
{
    [self showHUDWindowWithTitle:@"测试NSObject的HUD"];
}
@end
