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

@property(weak, nonatomic) NSTimer *time;
@property(strong, nonatomic) NSThread * thread;


@end

@implementation firstVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = [NSString stringWithFormat:@"第%ld个页面",self.navigationController.viewControllers.count + 1];
    
    self.hidesBottomBarWhenPushed = NO;
    _lb_title.text = @"测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测测试测试测试测试测试测试测试测试";
    
    self.thread = [[NSThread alloc] initWithTarget:self selector:@selector(performTask) object:nil];
    [self.thread start];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

}


- (IBAction)handleBtnNextClicked:(id)sender {
    firstToNextVC *t_vc = [[firstToNextVC alloc] init];
    [self.navigationController pushViewController:t_vc animated:YES];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event{
    
    [self.thread cancel];

}

- (void)performTask{

    __weak typeof(self) weakSelf = self;
    
    //modes 内部至少有一个observer/timer/source才可以
    
    if (@available(iOS 10.0, *)) {
        self.time = [NSTimer scheduledTimerWithTimeInterval:1.0f repeats:YES block:^(NSTimer * _Nonnull timer) {
            
            if ([NSThread currentThread].isCancelled) {
                [weakSelf.time invalidate];
            }
            
            NSLog(@"time......");
            
        }];
    } else {
        // Fallback on earlier versions
    }
    
    NSLog(@"runloop before performSelector:%@",[NSRunLoop currentRunLoop]);
    [self performSelector:@selector(caculate) withObject:nil afterDelay:2.0];
    NSLog(@"runloop after performSelector:%@",[NSRunLoop currentRunLoop]);
    
    // 非主线程RunLoop必须手动调用
    [[NSRunLoop currentRunLoop] run];
    
    NSLog(@"注意：如果RunLoop不退出（运行中），这里的代码并不会执行，RunLoop本身就是一个循环.");
    
}


- (void)caculate {
    for (int i = 0;i < 9999;++i) {
        NSLog(@"%i,%@",i,[NSThread currentThread]);
        if ([NSThread currentThread].isCancelled) {
            return;
        }
    }
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

- (void)dealloc{
    [self.time invalidate];
    
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
