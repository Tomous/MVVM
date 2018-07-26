//
//  ViewController.m
//  MVVM-Login
//
//  Created by 大橙子 on 2018/7/26.
//  Copyright © 2018年 中都格罗唯视. All rights reserved.
//

#import "ViewController.h"
#import "DCLoginView.h"
#import "DCLoginViewModel.h"
@interface ViewController ()

@property (nonatomic,strong) DCLoginView *loginView;
@property (nonatomic,strong) DCLoginViewModel *loginViewModel;
@end

@implementation ViewController

-(void)loadView
{
    DCLoginView *loginView = [[DCLoginView alloc]init];
    self.loginView = loginView;
    self.view = loginView;
}
-(DCLoginViewModel *)loginViewModel
{
    if (!_loginViewModel) {
        _loginViewModel = [DCLoginViewModel new];
    }
    return _loginViewModel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.loginViewModel.loginView = self.loginView;
    
    [self addLoginViewAction];
}
-(void)addLoginViewAction{
    
#pragma mark - 登陆
    __weak typeof(self) weakself = self;
    [[self.loginView.signInButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        
        [self.loginViewModel.loginCommond execute:nil];
        
        NSLog(@"signInButtonDidClick");
    }];
    
#pragma mark - 注册
    [[self.loginView.signUpButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {

        [weakself showMessage:@"点击了注册按钮" afterDelay:1.0];
        
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
