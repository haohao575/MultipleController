//
//  TH_modelSingleton.m
//  MultipleControllersOneControllers
//
//  Created by 童浩 on 15/10/22.
//  Copyright © 2015年 蓝鸥科技. All rights reserved.
//

#import "TH_modelSingleton.h"

@implementation TH_modelSingleton
+ (instancetype)singleton{
    static TH_modelSingleton *model = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        model = [[TH_modelSingleton alloc]init];
    });
    return model;
}

@end
