//
//  threeVC.m
//  test
//
//  Created by hcat on 2017/9/19.
//  Copyright © 2017年 Hcat. All rights reserved.
//

#import "threeVC.h"

@interface threeVC ()

@end

@implementation threeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
   NSLog(@"33333");
    
}

#pragma mark - AKTabBar Method

- (NSString *)tabImageName{
    return @"tab_addressBook_n";
}

- (NSString *)tabSelectedImageName{
    return @"tab_addressBook_n";
}

- (NSString *)tabTitle{
    return nil;
}

- (BOOL)isSpecialTab{
    return YES;
}

- (float)specialHeight{
    return 80;
    
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
