//
//  DCLoginViewModel.h
//  MVVM-Login
//
//  Created by 大橙子 on 2018/7/26.
//  Copyright © 2018年 中都格罗唯视. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveObjC/ReactiveObjC.h>
#import "DCLoginView.h"
@interface DCLoginViewModel : NSObject

@property(nonatomic,strong)RACCommand * loginCommond;

@property (nonatomic,copy)NSString *username;
@property (nonatomic,copy)NSString *password;
@property (nonatomic,strong) DCLoginView *loginView;
@end
