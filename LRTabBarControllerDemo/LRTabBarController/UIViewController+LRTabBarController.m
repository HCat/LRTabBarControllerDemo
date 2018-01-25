//
//  UIViewController+LRTabBarController.m
//
//  Created by hcat on 2017/10/10.
//  Copyright © 2017年 Hcat. All rights reserved.
//

#import "UIViewController+LRTabBarController.h"

#import "LRTabBarController.h"

@implementation UIViewController (LRTabBarController)

- (NSString *)tabImageName
{
	return nil;
}

- (NSString *)tabSelectedImageName
{
    return nil;
}

- (NSString *)tabTitle
{
	return nil;
}

-(void)tabBarReSelected{
    
}

- (BOOL)isSpecialTab{
    return NO;
}

- (float)specialHeight{
    return 0;
}


-(BOOL)showMask{
    return NO;
}

-(NSInteger)showMaskNumber{
    return 0;
}

- (LRTabBarController *)lrTabBarController
{
    UIViewController *parent = self.parentViewController;
    Class cls = [LRTabBarController class];
    while(parent) {
        if([parent isKindOfClass:cls]) {
            return (LRTabBarController*) parent;
        }
        parent = parent.parentViewController;
    }

    return nil;
}

@end
