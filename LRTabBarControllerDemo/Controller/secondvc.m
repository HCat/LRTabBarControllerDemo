//
//  secondvc.m
//  test
//
//  Created by hcat on 2017/9/19.
//  Copyright © 2017年 Hcat. All rights reserved.
//

#import "secondvc.h"

@interface secondvc ()

@end

@implementation secondvc

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"22222");
    
}

#pragma mark - AKTabBar Method

- (NSString *)tabImageName{
    return @"tab_list_n";
}

- (NSString *)tabSelectedImageName{
    return @"tab_list_h";
}

- (NSString *)tabTitle{
    return NSLocalizedString(@"待处理", nil);
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
