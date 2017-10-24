//
//  FAImageView.h
//  TopViewDemo
//
//  Created by 庄BB的MacBook on 2017/10/24.
//  Copyright © 2017年 BBFC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSString+FontAwesome.h"

@interface FAImageView : UIImageView
/* The background color for the default view displayed when the image is missing */
@property (nonatomic, strong) UIColor *defaultIconColor UI_APPEARANCE_SELECTOR;

/* Set the icon using the fontawesome icon's identifier */
@property (nonatomic, strong) NSString *defaultIconIdentifier;

/* Set the icon using the icon enumerations */
@property (nonatomic, assign) FAIcon defaultIcon;

/* The view that is displayed when the image is set to nil */
@property (nonatomic, strong) UILabel *defaultView;
@end
