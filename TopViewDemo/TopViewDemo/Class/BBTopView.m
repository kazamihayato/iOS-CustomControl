//
//  BBTopView.m
//  TopViewDemo
//
//  Created by 庄BB的MacBook on 2017/10/20.
//  Copyright © 2017年 BBFC. All rights reserved.
//

#import "BBTopView.h"
#import "UIFont+FontAwesome.h"
#import "NSString+FontAwesome.h"

#define SCREEN_WIDTH    [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT   [[UIScreen mainScreen] bounds].size.height

#define SuccessColor    [UIColor colorWithRed:47/255.0f green:204/255.0f blue:112/255.0f alpha:1]
#define FailColor       [UIColor colorWithRed:232/255.0f green:78/255.0f blue:60/255.0f alpha:1]
#define WaringColor     [UIColor colorWithRed:230.0f/255.0f green:95.0f/255.0f blue:7.0f/255.0f alpha:1]

static const CGFloat waringHeight  = 64.0f;
static const CGFloat AlertWidth    = 270.0f;
static const CGFloat AlertGap      = 10.0f;

@interface BBTopView ()
@property(nonatomic,strong)UILabel  * titleLabel;
@property(nonatomic,strong)UILabel  * messageLabel;
@property(nonatomic,strong)NSString * state;
@property(nonatomic,strong)UIColor  * infoColor;
@end

@implementation BBTopView

+(void)showTopSuccess:(NSString *)successInfo
{
    BBTopView*topView=[[BBTopView alloc] initTopViewWithNoticeType:Success noticeInfo:successInfo];
    [topView show];
}

+(void)showTopFailed:(NSString *)failedInfo
{
    BBTopView*topView=[[BBTopView alloc] initTopViewWithNoticeType:Fail noticeInfo:failedInfo];
    [topView show];
}

+(void)showTopWarning:(NSString *)warningInfo
{
    BBTopView*topView=[[BBTopView alloc] initTopViewWithNoticeType:Warning noticeInfo:warningInfo];
    [UIColor whiteColor];
    [topView show];
}

-(instancetype)initTopViewWithNoticeType:(NoticeType)noticeType
                              noticeInfo:(NSString *)noticeInfo
{
    self=[super init];
    if (self) {
        
        switch (noticeType) {
            case Success:
            {
                self.state     = [NSString fontAwesomeIconStringForEnum:FACheckCircle];
                self.infoColor = SuccessColor;
            }
                break;
            case Fail:
            {
                self.state     = [NSString fontAwesomeIconStringForEnum:FATimesCircle];
                self.infoColor = FailColor;
            }
                break;
            case Warning:
            {
                self.state     = [NSString fontAwesomeIconStringForEnum:FAExclamationCircle];
                self.infoColor = WaringColor;
            }
                break;
            default:
                break;
        }
        [self createTopViewWithNoticeInfo:noticeInfo];
        
    }
    return self;
}

-(void)createTopViewWithNoticeInfo:(NSString *)noticeInfo
{
    self.frame                      = CGRectMake(0, -waringHeight, SCREEN_WIDTH,waringHeight);
    self.backgroundColor            = self.infoColor;
    self.titleLabel                 = [[UILabel alloc] initWithFrame:CGRectMake(2*AlertGap, 4, waringHeight-30, waringHeight)];
    self.titleLabel.backgroundColor = [UIColor clearColor];
    self.titleLabel.textColor       = [UIColor whiteColor];
    self.titleLabel.textAlignment   = NSTextAlignmentCenter;
    self.titleLabel.font            = [UIFont fontAwesomeFontOfSize:35];
    self.titleLabel.text            = self.state;
    self.titleLabel.layer.opacity   = 0;
    
    [self addSubview:self.titleLabel];
    
    CGFloat infoHeight              =  [self heightWithString:noticeInfo fontSize:15 width:AlertWidth];
   
    self.messageLabel               = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.titleLabel.frame), (waringHeight-infoHeight)/2+5, SCREEN_WIDTH-CGRectGetMaxX(self.titleLabel.frame)*2, infoHeight)];
    self.messageLabel.text          = noticeInfo;
    self.messageLabel.textColor     = [UIColor whiteColor];
    self.messageLabel.textAlignment = NSTextAlignmentCenter;
    self.messageLabel.font          = [UIFont boldSystemFontOfSize:15];
    
    [self addSubview:self.messageLabel];
}

-(void)show
{
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:1 options:UIViewAnimationOptionCurveLinear animations:^{
        
        self.frame                    =    CGRectMake(0, 0, SCREEN_WIDTH,waringHeight);
        
    } completion:^(BOOL finished) {
        
        self.titleLabel.layer.opacity = 1;
        self.titleLabel.transform     = CGAffineTransformMakeScale(0, 0);
        
        [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:1 options:UIViewAnimationOptionCurveLinear animations:^{
            
            self.titleLabel.transform = CGAffineTransformMakeScale(1, 1);
            
        } completion:^(BOOL finished) {
            
        }];
    }];
    [self performSelector:@selector(dismiss) withObject:nil afterDelay:2.0];
}
-(void)dismiss
{
    [UIView animateWithDuration:0.3 animations:^{
        
        self.center=CGPointMake(CGRectGetMidX(self.frame), self.frame.origin.y-waringHeight);
        
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

-(CGFloat)heightWithString:(NSString*)string fontSize:(CGFloat)fontSize width:(CGFloat)width
{
    NSDictionary *attrs = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]};
    return  [string boundingRectWithSize:CGSizeMake(width, 0) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attrs context:nil].size.height;
}

@end
