//
//  UIFont+FontAwesome.m
//  TopViewDemo
//
//  Created by 庄BB的MacBook on 2017/10/24.
//  Copyright © 2017年 BBFC. All rights reserved.
//

#import "UIFont+FontAwesome.h"
#import "NSString+FontAwesome.h"

@implementation UIFont (FontAwesome)
#pragma mark - Public API
+ (UIFont*)fontAwesomeFontOfSize:(CGFloat)size {
    return [UIFont fontWithName:kFontAwesomeFamilyName size:size];
}

@end
