//
//  FAImageView.m
//  TopViewDemo
//
//  Created by 庄BB的MacBook on 2017/10/24.
//  Copyright © 2017年 BBFC. All rights reserved.
//

#import "FAImageView.h"
#import "UIFont+FontAwesome.h"

@implementation FAImageView

/* When the image is set to nil the defaultView will be added as subview,
 * otherwise it will be removed */
- (void)setImage:(UIImage*)image
{
    [super setImage:image];
    self.defaultView.hidden = (nil != image);
}

#pragma mark - Toggle the icon view

/* Lazy initialization of the view */
- (UILabel*)defaultView
{
    if (nil != _defaultView)
        return _defaultView;
    
    //The size of the default view is the same of self
    _defaultView = [[UILabel alloc] initWithFrame:self.bounds];
    _defaultView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    //The default icon is the ban icon
    [self setDefaultIcon:FABan];
    
    _defaultView.font = [UIFont fontAwesomeFontOfSize:self.bounds.size.height];
    _defaultView.textAlignment = NSTextAlignmentCenter;
    _defaultView.adjustsFontSizeToFitWidth = YES;
    
    //UIAppearance selectors
    _defaultView.textColor = [UIColor whiteColor];
    _defaultView.backgroundColor = [UIColor colorWithRed:.9f green:.9f blue:.9f alpha:1.f];
    
    //It starts hidden
    _defaultView.hidden = YES;
    
    [self addSubview:_defaultView];
    
    return _defaultView;
}

#pragma mark - Properties

- (void)setDefaultIconIdentifier:(NSString*)defaultIconIdentifier
{
    self.defaultIcon = [NSString fontAwesomeEnumForIconIdentifier:defaultIconIdentifier];
}

- (void)setDefaultIcon:(FAIcon)defaultIcon
{
    _defaultIcon = defaultIcon;
    _defaultView.text = [NSString fontAwesomeIconStringForEnum:defaultIcon];
}
@end
