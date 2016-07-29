//
//  BasePageViewController.m
//  PageViewControllerDemo
//
//  Created by 庄BB的MacBook on 16/7/29.
//  Copyright © 2016年 BBFC. All rights reserved.
//

#import "BasePageViewController.h"
#import "BaseViewController.h"
#import "HMSegmentedControl.h"


#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define WEAK_SELF __weak typeof(self)weakSelf = self
#define STRONG_SELF __strong typeof(weakSelf)self = weakSelf


@interface BasePageViewController ()<UIPageViewControllerDataSource,UIPageViewControllerDelegate>

@property(nonatomic,strong)UIPageViewController * pageView;
@property(nonatomic,assign)CGRect                 frame;
@property(nonatomic,strong)HMSegmentedControl   * segment;
@property(nonatomic,assign)NSInteger              index;
@end


@implementation BasePageViewController
{
    NSInteger _lastIndex;
}
-(instancetype)init
{
    self=[super init];
    if (self) {
        self.frame       = CGRectMake(0, 40, SCREEN_WIDTH, SCREEN_HEIGHT);
    }
    return self;
}
-(instancetype)initWithPageViewFrame:(CGRect)frame
{
    self=[super init];
    if (self) {
        
        self.frame       = frame;
        
    }
    return self;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self constructData];
    [self configSegment];
    [self createPageView];
    [self createSegment];
}
-(void)constructData
{
    
}
-(void)configSegment
{
    
}
-(void)createPageView
{
    _pageView=[[UIPageViewController alloc]initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    _pageView.view.frame = self.frame;
    _pageView.dataSource = self;
    _pageView.delegate   = self;
    [self addChildViewController:_pageView];
    [self.view addSubview:_pageView.view];
    [_pageView didMoveToParentViewController:self];
    
    BaseViewController*firstVC=self.controllers[0];
    [_pageView setViewControllers:@[firstVC] direction:UIPageViewControllerNavigationDirectionReverse animated:NO completion:^(BOOL finished) {
        firstVC.page=0;
    }];
}
-(void)createSegment
{
    _segment=[[HMSegmentedControl alloc] initWithSectionTitles:self.titles];
    _segment.frame=CGRectMake(0, _pageView.view.frame.origin.y-40, SCREEN_WIDTH, 40);
    _segment.titleTextAttributes         = self.titleTextAttributes;
    _segment.selectedTitleTextAttributes = self.selectedTitleTextAttributes;
    _segment.selectionIndicatorColor     = [UIColor redColor];
    _segment.selectionIndicatorLocation  = HMSegmentedControlSelectionIndicatorLocationDown;
    _segment.segmentWidthStyle           = HMSegmentedControlSegmentWidthStyleFixed;
    _segment.selectionStyle              = HMSegmentedControlSelectionStyleTextWidthStripe;
    _segment.selectionIndicatorHeight    = 2.0f;
    _segment.borderType                  = self.boardType;
    _segment.borderColor                 = [UIColor grayColor];
    _segment.borderWidth                 = 0.5f;
    
    WEAK_SELF;
    [_segment setIndexChangeBlock:^(NSInteger index) {
        STRONG_SELF;
        BaseViewController*vc=self.controllers[index];
        [weakSelf.pageView setViewControllers:@[vc] direction:index>_lastIndex? UIPageViewControllerNavigationDirectionForward:UIPageViewControllerNavigationDirectionReverse animated:NO completion:^(BOOL finished)
         {
             vc.page=index;
         }];
        
    }];
    [self.view addSubview:_segment];
    
}
- (void)selectPageWith:(NSInteger)index
{
    [_segment setSelectedSegmentIndex:index animated:YES];
}
#pragma mark-UIPageViewDataSource
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    BaseViewController*vc=(BaseViewController*)viewController;
    NSInteger index=vc.page;
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    index--;
    return index>=self.controllers.count?nil:self.controllers[index];
}
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    BaseViewController*vc=(BaseViewController*)viewController;
    NSInteger index=vc.page;
    if (index == NSNotFound)
    {
        return nil;
    }
    index++;
    if (index == self.controllers.count)
    {
        return nil;
    }
    return index>=self.controllers.count?nil:self.controllers[index];
}
#pragma mark-UIPageViewDelegate

- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers transitionCompleted:(BOOL)completed
{
    if (completed)
    {
        BaseViewController*vc=(BaseViewController*)pageViewController.viewControllers[0];
        NSInteger currentPage=vc.page;
        vc.page = currentPage;
        
        [_segment setSelectedSegmentIndex:currentPage animated:YES];
    }
}

-(BaseViewController*)createHomePageControllerWith:(Class)Controller
{
    BaseViewController*page=[[Controller alloc] init];
    page.view.clipsToBounds = NO;
    page.page=self.index;
    self.index++;
    return page;
}
@end
