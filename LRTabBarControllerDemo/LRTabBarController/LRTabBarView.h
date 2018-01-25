//
//  LRTabBarView.h
//
//  Created by hcat on 2017/9/25.
//  Copyright © 2017年 Hcat. All rights reserved.
//

#import "LRTabBar.h"

@interface LRTabBarView : UIView

@property (nonatomic, strong) LRTabBar *tabBar;
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, assign) BOOL isTabBarHidding;
@end
