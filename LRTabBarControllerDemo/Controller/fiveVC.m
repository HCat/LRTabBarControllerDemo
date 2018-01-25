//
//  fiveVC.m
//  test
//
//  Created by hcat on 2017/9/19.
//  Copyright © 2017年 Hcat. All rights reserved.
//

#import "fiveVC.h"

@interface fiveVC ()

@end

@implementation fiveVC

- (void)viewDidLoad {
    [super viewDidLoad];
   
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
     NSLog(@"5555");

}

#pragma mark - AKTabBar Method

- (NSString *)tabImageName{
    return @"tab_user_n";
}

- (NSString *)tabSelectedImageName{
    return @"tab_user_h";
}

- (NSString *)tabTitle{
    return NSLocalizedString(@"我的", nil);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
