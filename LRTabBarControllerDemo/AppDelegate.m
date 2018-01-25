//
//  AppDelegate.m
//  LRTabBarControllerDemo
//
//  Created by hcat on 2018/1/25.
//  Copyright © 2018年 Hcat. All rights reserved.
//

#import "AppDelegate.h"
#import "firstVC.h"
#import "secondvc.h"
#import "threeVC.h"
#import "fourVC.h"
#import "fiveVC.h"


#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor redColor];
    [self initAKTabBarController];
    self.window.rootViewController = self.vc_tabBar;
    [self.window makeKeyAndVisible];
    return YES;
}

#pragma mark - 初始化Tabbar

-(void)initAKTabBarController{
    
    if (_vc_tabBar == nil) {
        
        self.vc_tabBar = [[LRTabBarController alloc]initWithTabBarHeight:50];
        [_vc_tabBar setDelegate:(id<LRTabBarControllerDelegate>)self];
        
        [_vc_tabBar setTabBar_bgImageName:@"tabbar_bg"];
        //[_vc_tabBar setTabBar_bgColor:[UIColor blueColor]];
        
        [_vc_tabBar setTab_selectedBgImageName:@"tabbar_bg"];
        //[_vc_tabBar setTab_selectedBgColor:[UIColor redColor]];
        
        [_vc_tabBar setTab_titleColor:UIColorFromRGB(0xbbbbbb)];
        [_vc_tabBar setTab_selectedTitleColor:UIColorFromRGB(0x4281e8)];
        [_vc_tabBar setTab_titleFont:[UIFont systemFontOfSize:11.f]];
        
        [_vc_tabBar setIsTitleHidden:NO];
        [_vc_tabBar setIsGlossySelected:YES];
        
        
        firstVC *t_vc_main = [firstVC new];
        t_vc_main.view.backgroundColor = [UIColor whiteColor];
        UINavigationController *t_nav_main = [[UINavigationController alloc] initWithRootViewController:t_vc_main];
        
        secondvc *t_vc_list = [secondvc new];
        t_vc_list.view.backgroundColor = [UIColor greenColor];
        UINavigationController *t_nav_list = [[UINavigationController alloc] initWithRootViewController:t_vc_list];
        
        threeVC *t_vc_tongxunlu = [threeVC new];
        t_vc_tongxunlu.view.backgroundColor = [UIColor yellowColor];
        UINavigationController *t_nav_tongxunlu = [[UINavigationController alloc] initWithRootViewController:t_vc_tongxunlu];
        
        fourVC *t_vc_message = [fourVC new];
        t_vc_message.view.backgroundColor = [UIColor blueColor];
        UINavigationController *t_nav_message = [[UINavigationController alloc] initWithRootViewController:t_vc_message];
        
        fiveVC *t_vc_user = [fiveVC new];
        t_vc_user.view.backgroundColor = [UIColor redColor];
        UINavigationController *t_nav_user = [[UINavigationController alloc] initWithRootViewController:t_vc_user];
        
        [_vc_tabBar setViewControllers:[@[t_nav_main,t_nav_list,t_nav_tongxunlu,t_nav_message,t_nav_user]mutableCopy]];
        
    }
    
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
