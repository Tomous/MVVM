//
//  DCLoginView.m
//  MVVM-Login
//
//  Created by 大橙子 on 2018/7/26.
//  Copyright © 2018年 中都格罗唯视. All rights reserved.
//

#import "DCLoginView.h"

@implementation DCLoginView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setUpLoginView];
    }
    return self;
}
-(void)setUpLoginView
{
    //用户名
    _usernameTextField = [[UITextField alloc]init];
    _usernameTextField.placeholder = @"用户名";
    _usernameTextField.textColor = [UIColor blackColor];
    _usernameTextField.font = [UIFont systemFontOfSize:15];
    _usernameTextField.backgroundColor = [UIColor lightGrayColor];
    _usernameTextField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _usernameTextField.layer.borderWidth = 0.6;
    _usernameTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self addSubview:_usernameTextField];
    
    //密码
    _passwordTxtField = [[UITextField alloc]init];
    _passwordTxtField.placeholder = @"密码";
    _passwordTxtField.textColor = [UIColor blackColor];
    _passwordTxtField.font = [UIFont systemFontOfSize:15];
    _passwordTxtField.secureTextEntry = YES;
    _passwordTxtField.backgroundColor = [UIColor lightGrayColor];
    _passwordTxtField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _passwordTxtField.layer.borderWidth = 0.6;
    _passwordTxtField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self addSubview:_passwordTxtField];
    
    //登陆
    _signInButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _signInButton.layer.cornerRadius = 4;
    _signInButton.layer.masksToBounds = YES;
    [_signInButton setTitle:@"登录" forState:UIControlStateNormal];
    [_signInButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _signInButton.backgroundColor = [UIColor redColor];
    [self addSubview:_signInButton];
    
    //登陆
    _signUpButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _signUpButton.layer.cornerRadius = 4;
    _signUpButton.layer.masksToBounds = YES;
    [_signUpButton setTitle:@"注册" forState:UIControlStateNormal];
    [_signUpButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _signUpButton.backgroundColor = [UIColor redColor];
    [self addSubview:_signUpButton];
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    _usernameTextField.frame = CGRectMake((self.width - 150)/2, 190, 150, 40);
    _passwordTxtField.frame = CGRectMake((self.width - 150)/2, CGRectGetMaxY(_usernameTextField.frame)+10, 150, 40);
    _signInButton.frame = CGRectMake((self.width - 180)/2, CGRectGetMaxY(_passwordTxtField.frame)+30, 80, 40);
    
    _signUpButton.frame = CGRectMake(CGRectGetMaxX(_signInButton.frame)+20, _signInButton.y, _signInButton.width, _signInButton.height);
}
-(BOOL)isValidate
{
    if ([_usernameTextField.text isEqualToString:@""]) {
        return NO;
    }
    if ([_passwordTxtField.text isEqualToString:@""]) {
        return NO;
    }
    return YES;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
