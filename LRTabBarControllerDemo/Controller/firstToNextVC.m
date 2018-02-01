//
//  firstToNextVC.m
//  LRTabBarControllerDemo
//
//  Created by hcat on 2018/1/25.
//  Copyright © 2018年 Hcat. All rights reserved.
//

#import "firstToNextVC.h"
#import "AppDelegate.h"

@interface firstToNextVC ()
@property (weak, nonatomic) IBOutlet UILabel *lb_title;

@end

@implementation firstToNextVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = [NSString stringWithFormat:@"第%ld个页面",self.navigationController.viewControllers.count];
    self.hidesBottomBarWhenPushed = YES;
    self.lb_title.text = [NSString stringWithFormat:@"%@",self];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    

}


- (IBAction)handleBtnNextClicked:(id)sender {
    firstToNextVC *t_vc = [firstToNextVC new];
    [self.navigationController pushViewController:t_vc animated:YES];
    
}



#pragma mark - dealloc

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
