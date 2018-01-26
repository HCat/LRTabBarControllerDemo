//
//  fourVC.m
//  test
//
//  Created by hcat on 2017/9/19.
//  Copyright © 2017年 Hcat. All rights reserved.
//

#import "fourVC.h"
#import "AppDelegate.h"

@interface fourVC ()

@property (weak, nonatomic) IBOutlet UITextField *tf_count;

@end

@implementation fourVC

- (void)viewDidLoad {
    [super viewDidLoad];
     [self addChangeForEventEditingChanged:self.tf_count];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"44444");
    
}

#pragma mark - AKTabBar Method

- (NSString *)tabImageName{
    return @"tab_message_n";
}

- (NSString *)tabSelectedImageName{
    return @"tab_message_h";
}

- (NSString *)tabTitle{
    return NSLocalizedString(@"消息", nil);
}

-(BOOL)showMask{
    return [_tf_count.text integerValue] > 0 ? YES : NO;
}

-(NSInteger)showMaskNumber{
    return [_tf_count.text integerValue];
}

#pragma mark -

- (void)addChangeForEventEditingChanged:(UITextField *)textField{
    [textField addTarget:self action:@selector(passConTextChange:) forControlEvents:UIControlEventEditingChanged];
}

-(void)passConTextChange:(id)sender{
    
    AppDelegate *t_app =  (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    [t_app.vc_tabBar loadTabs];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
 
    [_tf_count resignFirstResponder];
    return YES;
    
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
