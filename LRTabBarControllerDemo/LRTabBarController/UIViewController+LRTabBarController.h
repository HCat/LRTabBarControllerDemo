//
//  UIViewController+LRTabBarController.h
//
//  Created by hcat on 2017/10/10.
//  Copyright © 2017年 Hcat. All rights reserved.
//

@class LRTabBarController;

@interface UIViewController (LRTabBarController)

// tab的未选中图片名称
- (NSString *)tabImageName;

// tab的选中图片名称
- (NSString *)tabSelectedImageName;

// tab的title
- (NSString *)tabTitle;

// 当选中相同按钮适合所做的操作
- (void)tabBarReSelected;


// 是否设置特殊tab
- (BOOL)isSpecialTab;

- (float)specialHeight;

// 是否显示通知标签
- (BOOL)showMask;

// 显示标签数目
- (NSInteger)showMaskNumber;



// 获取tabBarController
- (LRTabBarController*)lrTabBarController;


@end
