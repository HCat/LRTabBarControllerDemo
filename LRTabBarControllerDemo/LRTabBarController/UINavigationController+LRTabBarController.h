//
//  UINavigationController+LRTabBarController.h
//
//  Created by hcat on 2017/10/10.
//  Copyright © 2017年 Hcat. All rights reserved.
//

@interface UINavigationController (LRTabBarController)

- (NSString *)tabImageName;

- (NSString *)tabSelectedImageName;

- (NSString *)tabTitle;

- (BOOL)isSpecialTab;

- (float)specialHeight;

- (BOOL)showMask;

- (NSInteger)showMaskNumber;


@end
