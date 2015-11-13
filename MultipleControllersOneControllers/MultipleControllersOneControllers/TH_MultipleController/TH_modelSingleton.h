//
//  TH_modelSingleton.h
//  MultipleControllersOneControllers
//
//  Created by 童浩 on 15/10/22.
//  Copyright © 2015年 蓝鸥科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface TH_modelSingleton : NSObject
@property (nonatomic,strong)void (^block)(BOOL);
@property (nonatomic,strong)void (^pusBlock)(BOOL,id);
+ (instancetype)singleton;
@end
