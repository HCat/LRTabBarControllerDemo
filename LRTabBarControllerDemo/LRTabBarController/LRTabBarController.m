//
//  LRTabBarController.m
//
//  Created by hcat on 2017/9/25.
//  Copyright © 2017年 Hcat. All rights reserved.
//

#import "LRTabBarController.h"
#import "UIViewController+LRTabBarController.h"



// 默认tabBar高度
static const int kDefaultTabBarHeight = 50;

// 默认show/hide动画时间
static const float kPushAnimationDuration = 0.35;

@interface LRTabBarController (){
    NSArray *prevViewControllers;
    BOOL visible;
}

@property (nonatomic,strong) UIViewController *currentShowVC;

- (void)loadTabs;
- (void)showTabBar:(CGFloat)directionVector animated:(BOOL)animated;
- (void)hideTabBar:(CGFloat)directionVector animated:(BOOL)animated;

@end

@implementation LRTabBarController{
    LRTabBar *tabBar;           // 底部tabBar
    LRTabBarView *tabBarView;   // 内容视图tabBarView
    NSUInteger tabBarHeight;    // tabBar高度
}

#pragma mark - Initialization

- (id)init{
    return [self initWithTabBarHeight:kDefaultTabBarHeight];
}

- (id)initWithTabBarHeight:(NSUInteger)height{
    self = [super init];
    if (!self) return nil;
    
    tabBarHeight = height;

    return self;
}

-(LRTabBar *)getTabBar{
    return tabBar;
}

-(LRTabBarView *)getTabBarView{
    return tabBarView;
}

- (void)loadView{
    
    [super loadView];
    
    tabBarView = [[LRTabBarView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    self.view = tabBarView;
    
    CGRect tabBarRect = CGRectMake(0.0, CGRectGetHeight(self.view.bounds) - tabBarHeight, CGRectGetWidth(self.view.frame), tabBarHeight);
    
    
    tabBar = [[LRTabBar alloc] initWithFrame:tabBarRect];
    tabBar.delegate = self;
    tabBar.layer.shadowColor =  [UIColor colorWithRed:((float)((0x444444 & 0xFF0000) >> 16))/255.0 green:((float)((0x444444 & 0xFF00) >> 8))/255.0 blue:((float)(0x444444 & 0xFF))/255.0 alpha:1.0].CGColor;//shadowColor阴影颜色
    tabBar.layer.shadowOffset = CGSizeMake(0,-2);
    tabBar.layer.shadowOpacity = 0.1;
    tabBar.layer.shadowRadius = 2;
    
    tabBarView.tabBar = tabBar;
    tabBarView.contentView = _selectedViewController.view;
    [[self navigationItem] setTitle:[_selectedViewController title]];
    [self loadTabs];
    
}

- (void)loadTabs{
    
    NSMutableArray *tabs = [[NSMutableArray alloc] init];
    
    [tabBarView tabBar].tabBar_bgImageName =  _tabBar_bgImageName;
    [tabBarView tabBar].tabBar_bgColor = _tabBar_bgColor;
    [tabBarView tabBar].tabBar_strokeColor = _tabBar_strokeColor;
    [tabBarView tabBar].tabBar_topEdgeColor = _tabBar_topEdgeColor;
    
    for (UIViewController *vc in self.viewControllers){
        
        LRTab *tab = [[LRTab alloc] init];
        tab.tab_selectedBgImageName = _tab_selectedBgImageName;
        tab.tab_selectedBgColor = _tab_selectedBgColor;
        tab.tab_titleColor = _tab_titleColor;
        tab.tab_selectedTitleColor = _tab_selectedTitleColor;
        tab.tab_titleFont = _tab_titleFont;
        tab.isGlossySelected = _isGlossySelected;
        tab.isTitleHidden = _isTitleHidden;
        
        if ([vc isKindOfClass:[UIViewController class]]) {
            tab.tab_imageName = [vc tabImageName];
            tab.tab_selectedImageName = [vc tabSelectedImageName];
            tab.tab_title = [vc tabTitle];
            tab.showMark = [vc showMask];
            tab.markNumber = [vc showMaskNumber];
            
        }
        
        if ([vc isSpecialTab]) {
            tab.isSpecialTab = YES;
            tab.SpecialTabHeight = [vc specialHeight];
        }
        
        if ([[vc class] isSubclassOfClass:[UINavigationController class]])
            ((UINavigationController *)vc).delegate = self;
//            [((UINavigationController *)vc).interactivePopGestureRecognizer setDelegate:(id<UIGestureRecognizerDelegate> _Nullable)self];
        
        [tabs addObject:tab];
    }
    
    [tabBar setArr_tabs:tabs];
    
    if ([tabs count] > 0) {
        [tabBar setTab_selected:(tabBar.arr_tabs)[_selectedIndex]];
    }
}


#pragma - UINavigationControllerDelegate



- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
   
    __weak typeof(self) weakSelf = self;
    //滑动手势监听，用来监听滑动手势之后是否显示或者隐藏tabBar
    id< UIViewControllerTransitionCoordinator >tc = navigationController.transitionCoordinator;
    [tc notifyWhenInteractionEndsUsingBlock:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if ([context isCancelled]) {
        
            NSLog(@"手势滑动结束:%@",strongSelf.currentShowVC);
            BOOL hide = [strongSelf.currentShowVC hidesBottomBarWhenPushed];
            NSLog(@"[viewController lastObject]:%i",hide);
            if (hide) {
                [strongSelf hideTabBar:0.0f animated:animated];
            }else{
                [strongSelf showTabBar:0.0f animated:animated];
            }
        }else{
            BOOL hide = [[navigationController viewControllers].lastObject hidesBottomBarWhenPushed];
            if (hide) {
                [strongSelf hideTabBar:0.0f animated:animated];
            }else{
                [strongSelf showTabBar:0.0f animated:animated];
            }
            
        }
        
    }];
    
    
    if (!prevViewControllers){
        prevViewControllers = [navigationController viewControllers];
    }
    
    // We detect is the view as been push or popped
    BOOL pushed;
    
    if ([prevViewControllers count] <= [[navigationController viewControllers] count]){
        pushed = YES;
    }else{
        pushed = NO;
    }
    // Logic to know when to show or hide the tab bar
    BOOL isPreviousHidden, isNextHidden;
    
    isPreviousHidden = [[prevViewControllers lastObject] hidesBottomBarWhenPushed];
    isNextHidden = [viewController hidesBottomBarWhenPushed];
    
    prevViewControllers = [navigationController viewControllers];

    if (!isPreviousHidden && !isNextHidden){
        return;
    }else if (!isPreviousHidden && isNextHidden){
        [self hideTabBar:0.0f animated:animated];
    
    }else if (isPreviousHidden && !isNextHidden){
        [self showTabBar:1.0f animated:animated];
    
    }else if (isPreviousHidden && isNextHidden){
        return;
    }
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{

    if (navigationController.viewControllers.count == 1){
        self.currentShowVC = Nil;
    }else{
        self.currentShowVC = viewController;
    }
}


- (void)showTabBar:(CGFloat)directionVector animated:(BOOL)animated{
    
   
    tabBar.hidden = NO;
    tabBar.transform = CGAffineTransformMakeTranslation(0, CGRectGetHeight(tabBar.bounds) * directionVector);
    // when the tabbarview is resized we can see the view behind
    [tabBarView setContentView:_selectedViewController.view];
    if (animated) {
        [UIView animateWithDuration:((animated) ? kPushAnimationDuration : 0) animations:^{
            tabBar.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            tabBarView.isTabBarHidding = NO;
            [tabBarView setNeedsLayout];
        }];
    }else{
        tabBar.transform = CGAffineTransformIdentity;
        tabBarView.isTabBarHidding = NO;
        [tabBarView setNeedsLayout];
    }

}

- (void)hideTabBar:(CGFloat)directionVector animated:(BOOL)animated{
    
    tabBarView.isTabBarHidding = YES;
    
    CGRect tmpTabBarView = tabBarView.contentView.frame;
    tmpTabBarView.size.height = tabBarView.bounds.size.height;
    tabBarView.contentView.frame = tmpTabBarView;
    
    if (animated) {
        [UIView animateWithDuration:((animated) ? kPushAnimationDuration : 0) animations:^{
            tabBar.transform = CGAffineTransformMakeTranslation(0, CGRectGetHeight(tabBar.bounds) * directionVector);
        } completion:^(BOOL finished) {
            tabBar.hidden = YES;
            tabBar.transform = CGAffineTransformIdentity;
        }];
    }else{
        tabBar.transform = CGAffineTransformMakeTranslation(0, CGRectGetHeight(tabBar.bounds) * directionVector);
        tabBar.hidden = YES;
        tabBar.transform = CGAffineTransformIdentity;
    }
}

#pragma mark - Setters

- (void)setViewControllers:(NSMutableArray *)viewControllers{
    
    _viewControllers = viewControllers;
    
    // Add the view controllers as child view controllers, so they can find this controller
    if([self respondsToSelector:@selector(addChildViewController:)]) {
        for(UIViewController* vc in _viewControllers) {
            if ([vc isKindOfClass:[UIViewController class]]) {
                [self addChildViewController:vc];
            }
            
        }
    }

    // When setting the view controllers, the first vc is the selected one;
    if ([viewControllers count] > 0) {
        [self setSelectedViewController:viewControllers[0]];
    }
    
    // Load the tabs on the go
    [self loadTabs];
}

- (void)setSelectedViewController:(UIViewController *)selectedViewController{
    
    UIViewController *previousSelectedViewController = _selectedViewController;
    NSInteger selectedIndex = [self.viewControllers indexOfObject:selectedViewController];
    
    if (_selectedViewController != selectedViewController && selectedIndex != NSNotFound){
        
        _selectedViewController = selectedViewController;
        _selectedIndex = selectedIndex;
       
        if ((self.childViewControllers == nil || !self.childViewControllers.count) && visible){
			[previousSelectedViewController viewWillDisappear:NO];
			[selectedViewController viewWillAppear:NO];
		}
        
        [tabBarView setContentView:selectedViewController.view];
        
        if ((self.childViewControllers == nil || !self.childViewControllers.count) && visible){
			[previousSelectedViewController viewDidDisappear:NO];
			[selectedViewController viewDidAppear:NO];
		}
        
        [tabBar setTab_selected:(tabBar.arr_tabs)[selectedIndex]];
        
    }else if(_selectedViewController == selectedViewController){
        [_selectedViewController tabBarReSelected];
       
    }
}

- (void)setSelectedIndex:(NSInteger)selectedIndex{
    [self setSelectedViewController:(self.viewControllers)[selectedIndex]];
}

#pragma mark - Hide / Show Methods

- (void)showTabBarAnimated:(BOOL)animated {
    [self showTabBar:1.0f animated:animated];
}

- (void)hideTabBarAnimated:(BOOL)animated {
    [self hideTabBar:0.0f animated:animated];
}

#pragma mark - Required Protocol Method

- (void)tabBar:(LRTabBar *)LRTabBarDelegate didSelectTabAtIndex:(NSInteger)index{
    
    UIViewController *vc = (self.viewControllers)[index];
    if ([vc isKindOfClass:[NSArray class]]) {
       dispatch_block_t block  = ((NSArray *)vc)[1];
        block();
        return;
    }
    
    
    if (self.selectedViewController == vc){
        
        if ([vc isKindOfClass:[UINavigationController class]]){
            if (((UINavigationController *)self.selectedViewController).childViewControllers.count == 1) {
                
                [((UINavigationController *)self.selectedViewController).childViewControllers.lastObject tabBarReSelected];
       
            }else{
                
                [(UINavigationController *)self.selectedViewController popToRootViewControllerAnimated:YES];
                
            }
        }
        
    }else{
        [[self navigationItem] setTitle:[vc title]];
        self.selectedViewController = vc;
    }
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(tabBarControllerdidSelectTabAtIndex:)]) {
        [self.delegate tabBarControllerdidSelectTabAtIndex:index];
    }
}

#pragma mark - Rotation Events

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation{
    return [self.selectedViewController shouldAutorotateToInterfaceOrientation:toInterfaceOrientation];
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration{
    [self.selectedViewController willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation duration:(NSTimeInterval)duration{
    // Redraw with will rotating and keeping the aspect ratio
    for (LRTab *tab in [tabBar arr_tabs])
        [tab setNeedsDisplay];
    
    [self.selectedViewController willAnimateRotationToInterfaceOrientation:interfaceOrientation duration:duration];
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation{
    [self.selectedViewController didRotateFromInterfaceOrientation:fromInterfaceOrientation];
}

#pragma mark - ViewController Life cycle

- (void)viewWillAppear:(BOOL)animated{
    
	[super viewWillAppear:animated];
    
    if ((self.childViewControllers == nil || !self.childViewControllers.count)){
        [self.selectedViewController viewWillAppear:animated];
    }
    
}

- (void)viewDidAppear:(BOOL)animated{
    
	[super viewDidAppear:animated];
    
    if ((self.childViewControllers == nil || !self.childViewControllers.count)){
        [self.selectedViewController viewDidAppear:animated];
    }
    
    visible = YES;
    
}

- (void)viewWillDisappear:(BOOL)animated{
    
	[super viewWillDisappear:animated];
    
    if ((self.childViewControllers == nil || !self.childViewControllers.count)){
        [self.selectedViewController viewWillDisappear:animated];
    }
    
}

- (void)viewDidDisappear:(BOOL)animated{
    
	[super viewDidDisappear:animated];
    
    if (![self respondsToSelector:@selector(addChildViewController:)]){
        [self.selectedViewController viewDidDisappear:animated];
    }
    
    visible = NO;
    
}

- (void)dealloc{
    
    NSLog(@"LRTabBarController dealloc");

}

@end
