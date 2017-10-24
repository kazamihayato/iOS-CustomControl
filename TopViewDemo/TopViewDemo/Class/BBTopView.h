//
//  BBTopView.h
//  TopViewDemo
//
//  Created by 庄BB的MacBook on 2017/10/20.
//  Copyright © 2017年 BBFC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BBTopView : UIView

typedef NS_ENUM(NSInteger, NoticeType) {
    Success,
    Fail,
    Warning
};

+(void) showTopSuccess:(NSString*)successInfo;

+(void) showTopFailed:(NSString*)failedInfo;

+(void) showTopWarning:(NSString*)warningInfo;


@end
