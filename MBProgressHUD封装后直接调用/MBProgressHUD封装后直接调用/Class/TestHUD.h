//
//  TestHUD.h
//  MBProgressHUD类别分装
//
//  Created by 庄BB的MacBook on 16/7/25.
//  Copyright © 2016年 BBFC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestHUD : NSObject


+(void)testHUDLoadingBLock:(dispatch_block_t)successBlock;


-(void)showHUDWithTitle:(NSString*)title;

@end
