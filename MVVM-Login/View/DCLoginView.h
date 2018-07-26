//
//  DCLoginView.h
//  MVVM-Login
//
//  Created by 大橙子 on 2018/7/26.
//  Copyright © 2018年 中都格罗唯视. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DCLoginView : UIView

@property (strong, nonatomic)UITextField *usernameTextField;
@property (strong, nonatomic)UITextField *passwordTxtField;
@property (strong, nonatomic)UIButton *signInButton;//登陆按钮

@property (strong, nonatomic)UIButton *signUpButton;//登陆按钮


@property(nonatomic,assign)BOOL isValidate;
@end
