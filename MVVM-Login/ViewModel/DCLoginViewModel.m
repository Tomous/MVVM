//
//  DCLoginViewModel.m
//  MVVM-Login
//
//  Created by 大橙子 on 2018/7/26.
//  Copyright © 2018年 中都格罗唯视. All rights reserved.
//

#import "DCLoginViewModel.h"
#import "HomeViewController.h"
@implementation DCLoginViewModel

-(void)setLoginView:(DCLoginView *)loginView
{
    _loginView = loginView;
    RAC(self, username) = loginView.usernameTextField.rac_textSignal;
    RAC(self, password) = loginView.passwordTxtField.rac_textSignal;
}
- (instancetype) init
{
    if (self = [super init]) {
        
        [self setup];
    }
    return self;
}
- (void) setup {
    __weak typeof(self) weakself = self;
    self.loginCommond = [[RACCommand alloc]initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        
        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            
            if (!weakself.loginView.isValidate) {
                [[weakself getCurrentVC] showMessage:@"账户名或密码不能为空！" afterDelay:1.0];
                [subscriber sendCompleted];
                return nil;
            }
            
            //处理网络数据请求，请求成功之后跳转
            if ([weakself.loginView.usernameTextField.text isEqualToString:@"123"]&&[weakself.loginView.passwordTxtField.text isEqualToString:@"123"]) {
                
                [[weakself getCurrentVC] showMessage:@"验证成功之后跳转到首页" afterDelay:1.0 completion:^{
                    [[weakself getCurrentVC] presentViewController:[[HomeViewController alloc]init] animated:YES completion:nil];
                }];
            }else
            {
                [[weakself getCurrentVC] showMessage:@"账户名或密码错误！账户名：123 密码：123" afterDelay:2.0];
            }
            [subscriber sendCompleted];
            return nil;
        }];
    }];
}
@end
