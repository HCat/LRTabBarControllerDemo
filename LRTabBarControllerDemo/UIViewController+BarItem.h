//
//  UINavigationBar+BarItem.h
//  jiulifang
//
//  Created by hesh on 13-10-29.
//  Copyright (c) 2013年 ilikeido. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIViewController (BarItem)

// 设置TitleBtn
- (void)showLeftBarButtonItemWithTitle:(NSString *)title target:(id)target action:(SEL)action ;

- (void)showRightBarButtonItemWithTitle:(NSString *)title target:(id)target action:(SEL)action ;

// 设置ImageBtn
- (void)showLeftBarButtonItemWithImage:(NSString *)image target:(id)target action:(SEL)action ;

- (void)showRightBarButtonItemWithImage:(NSString *)image target:(id)target action:(SEL)action ;

// 设置Title和Image的Btn
- (void)showLeftBarButtonItemWithTitle:(NSString *)title BgImageName:(NSString *)imageName target:(id)target action:(SEL)action;

- (void)showRightBarButtonItemWithTitle:(NSString *)title BgImageName:(NSString *)imageName target:(id)target action:(SEL)action;

// 设置nav的title
- (void)setTitleButtonItemWithTitle:(NSString *)title target:(id)target action:(SEL)action;

@end
