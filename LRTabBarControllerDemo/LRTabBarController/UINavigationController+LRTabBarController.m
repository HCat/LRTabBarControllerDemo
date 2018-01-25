//
//  UINavigationController+AKTabBarController.m
//
//  Created by hcat on 2017/10/10.
//  Copyright © 2017年 Hcat. All rights reserved.
//

#import "UINavigationController+LRTabBarController.h"

@implementation UINavigationController (LRTabBarController)

- (NSString *)tabImageName{
	return [(self.viewControllers)[0] tabImageName];
}

- (NSString *)tabSelectedImageName{
    return [(self.viewControllers)[0] tabSelectedImageName];
}

- (NSString *)tabTitle{
	return [(self.viewControllers)[0] tabTitle];
}

- (BOOL)isSpecialTab{
    return [(self.viewControllers)[0] isSpecialTab];
}

- (float)specialHeight{
    return  [(self.viewControllers)[0] specialHeight];
}

-(BOOL)showMask{
    return [(self.viewControllers)[0] showMask];
}

-(NSInteger)showMaskNumber{
    return [(self.viewControllers)[0] showMaskNumber];;
}


@end
