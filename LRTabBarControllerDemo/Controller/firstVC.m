//
//  firstVC.m
//  test
//
//  Created by hcat on 2017/9/19.
//  Copyright © 2017年 Hcat. All rights reserved.
//

#import "firstVC.h"
#import "firstToNextVC.h"
#import "AppDelegate.h"

@interface firstVC ()
@property (weak, nonatomic) IBOutlet UILabel *lb_title;

@end

@implementation firstVC

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.hidesBottomBarWhenPushed = NO;
    _lb_title.text = @"测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测测试测试测试测试测试测试测试测试";
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

}


- (IBAction)handleBtnNextClicked:(id)sender {
    firstToNextVC *t_vc = [[firstToNextVC alloc] init];
    [self.navigationController pushViewController:t_vc animated:YES];
    
    
}



#pragma mark - AKTabBar Method

- (NSString *)tabImageName{
    return @"tab_main_n";
}

- (NSString *)tabSelectedImageName{
    return @"tab_main_h";
}

- (NSString *)tabTitle{
    return NSLocalizedString(@"首页首页首页首页首页首页首页首页", nil);
}

-(BOOL)showMask{
    return NO;
}

-(NSInteger)showMaskNumber{
    return 0;
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
