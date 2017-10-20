//
//  BBAlertView.m
//  AlertViewDemo
//
//  Created by 庄BB的MacBook on 2017/10/17.
//  Copyright © 2017年 BBFC. All rights reserved.
//

#import "BBAlertView.h"

#define SCREEN_WIDTH  ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define RGB(r,g,b)   [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(1.0)]

const CGFloat AlertWidth = 270.0;
const CGFloat AlertGap   = 10.0;
const CGFloat BtnHeight  = 45.0;
const CGFloat BtnWidth   = 135.0;

@interface BBAlertView ()
@property(nonatomic, copy )NSString * title;
@property(nonatomic, copy )NSString * message;
@property(nonatomic,strong)NSArray  * btnArr;
@property(nonatomic, copy )dispatch_block_t leftBlock;
@property(nonatomic, copy )dispatch_block_t rightBlock;

@property(nonatomic,strong)UIView   * bgView;
@property(nonatomic,strong)UIView   * contentView;

@end


@implementation BBAlertView

+(void) showAlertViewWithTitle:(NSString *)title
                       message:(NSString *)message
                  buttonTitles:(NSArray *)btnArr
                  confirmBlock:(dispatch_block_t)confirmBlock
{
    [BBAlertView showAlertViewWithTitle:title message:message buttonTitles:btnArr leftBlock:nil rightBlock:confirmBlock];
}

+(void) showAlertViewWithTitle:(NSString*)title
                       message:(NSString*)message
                  buttonTitles:(NSArray*)btnArr
                     leftBlock:(dispatch_block_t)leftBlock
                    rightBlock:(dispatch_block_t)rightBlock
{
    BBAlertView * alertView=[[BBAlertView alloc] initAlertViewWithTitle:title message:message buttonTitles:btnArr leftBlock:leftBlock rightBlock:rightBlock];
    [alertView show];
}

-(instancetype)initAlertViewWithTitle:(NSString*)title
                              message:(NSString*)message
                         buttonTitles:(NSArray*)btnArray
                            leftBlock:(dispatch_block_t)leftBlock
                           rightBlock:(dispatch_block_t)rightBlock
{
    self=[super initWithFrame:[UIScreen mainScreen].bounds];
    if (self) {
        _title      = [title copy];
        _message    = [message copy];
        _btnArr     = btnArray;
        _leftBlock  = [leftBlock copy];
        _rightBlock = [rightBlock copy];
        
        [self addSubview:self.bgView];
        [self addSubview:self.contentView];
    }
    return self;
}

-(UIView*)bgView
{
    if (!_bgView) {
        _bgView                 = [[UIView alloc] initWithFrame:self.bounds];
        _bgView.backgroundColor = [UIColor blackColor];
        _bgView.alpha           = 0.0f;
    }
    return _bgView;
}

-(UIView*)contentView
{
    if (!_contentView) {
        _contentView                     = [[UIView alloc]init];
        _contentView.layer.cornerRadius  = 5;
        _contentView.layer.masksToBounds = YES;
        _contentView.backgroundColor     = [UIColor whiteColor];
        
        CGFloat titleHeight   = [self createTitle];
        CGFloat messageHeight = [self createMessageWithTitleHeight:titleHeight];
        CGFloat btnHeight     = [self createBtnWithMessageHeight:messageHeight];
        
        _contentView.frame    = CGRectMake((SCREEN_WIDTH-AlertWidth)/2, (SCREEN_HEIGHT-btnHeight)/2, AlertWidth, btnHeight);
    }
    return _contentView;
}

-(CGFloat)createTitle
{
    if (_title==NULL) {
        return 0;
    }
    CGFloat height            = [self heightWithString:_title fontSize:17 width:AlertWidth-2*AlertGap];
    
    UILabel * titleLabel       = [[UILabel alloc] initWithFrame:CGRectMake(AlertGap, AlertGap,AlertWidth-2*AlertGap,height)];
    titleLabel.text            = self.title;
    titleLabel.textColor       = RGB(28, 28, 28);
    titleLabel.font            = [UIFont systemFontOfSize:14];
    titleLabel.textAlignment   = NSTextAlignmentCenter;
    [self.contentView addSubview:titleLabel];
    
    return CGRectGetMaxY(titleLabel.frame);
}

-(CGFloat)createMessageWithTitleHeight:(CGFloat)titleHeight
{
    if (_message==NULL) {
        return 0;
    }
    CGFloat y= self.title.length==0?20.0:0.0;
    
    CGFloat height                  = [self heightWithString:_message fontSize:14 width:AlertWidth-2*AlertGap];
    UILabel * messageLabel          = [[UILabel alloc] initWithFrame:CGRectMake(AlertGap, y+AlertGap+titleHeight, AlertWidth-2*AlertGap, height)];
    messageLabel.numberOfLines      = 0;
    messageLabel.text               = _message;
    messageLabel.textColor          = RGB(28, 28, 28);
    messageLabel.font               = [UIFont systemFontOfSize:14];
    messageLabel.textAlignment      = NSTextAlignmentCenter;
    
    [self.contentView addSubview:messageLabel];
    
    return CGRectGetMaxY(messageLabel.frame)+AlertGap+y;
}

-(CGFloat)createBtnWithMessageHeight:(CGFloat)messageHeight
{
    UIView * btnView          = [[UIView alloc] initWithFrame:CGRectMake(0, messageHeight+AlertGap, AlertWidth, BtnHeight)];
    [self.contentView addSubview:btnView];
    
    
    [self.btnArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton*btn          =[UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame             =CGRectMake(BtnWidth*idx,0,self.btnArr.count==1?AlertWidth:BtnWidth, BtnHeight);
        btn.tag               = 221+idx;
        btn.titleLabel.font   = [UIFont systemFontOfSize:17];
        btn.layer.borderColor =[UIColor lightGrayColor].CGColor;
        btn.layer.borderWidth = 0.4f;
        
        [btn setTitle     :(NSString*)obj forState:UIControlStateNormal];
        [btn setTitleColor:RGB(28, 28, 28) forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
        
        [btnView addSubview:btn];
    }];
    
    return CGRectGetMaxY(btnView.frame);
}

-(void)show
{
    [UIView animateWithDuration:0.3 animations:^{
        self.bgView.alpha = 0.5;
    }];
    
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    
    CAKeyframeAnimation *popAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    popAnimation.duration = 0.4;
    popAnimation.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.01f, 0.01f, 1.0f)],
                            [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.1f, 1.1f, 1.0f)],
                            [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9f, 0.9f, 1.0f)],
                            [NSValue valueWithCATransform3D:CATransform3DIdentity]];
    popAnimation.keyTimes = @[@0.2f, @0.5f, @0.75f, @1.0f];
    popAnimation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                     [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                     [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [[_contentView layer] addAnimation:popAnimation forKey:nil];
}

-(void)dismiss
{
    [UIView animateWithDuration:0.4 animations:^{
        
        self.contentView.center = CGPointMake(CGRectGetMidX(self.frame),CGRectGetMidY(self.frame)+40);
        self.bgView.alpha       = 0.0;
        self.contentView.alpha  = 0.0;
        
    } completion:^(BOOL finished){
        
        [self removeFromSuperview];
        
    }];

}

-(void)btnPressed:(UIButton*)btn
{
    switch (btn.tag-221) {
        case 0:
        {
            if (self.btnArr.count==1) {
                if (_rightBlock) {
                    _rightBlock();
                }
            }
            
            if (_leftBlock) {
                _leftBlock();
            }
            
            [self dismiss];
        }
            break;
        case 1:
        {
            if (_rightBlock) {
                _rightBlock();
            }
            [self dismiss];
        }
            break;
        default:
            break;
    }
}

-(CGFloat)heightWithString:(NSString*)string fontSize:(CGFloat)fontSize width:(CGFloat)width
{
    NSDictionary *attrs = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]};
    return  [string boundingRectWithSize:CGSizeMake(width, 0) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attrs context:nil].size.height;
}

-(void)dealloc
{
    _leftBlock  = nil;
    _rightBlock = nil;
}
@end
