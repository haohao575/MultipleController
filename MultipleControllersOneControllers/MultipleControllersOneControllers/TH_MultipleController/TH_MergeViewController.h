//
//  TH_MergeViewController.h
//  MultipleControllersOneControllers
//
//  Created by 童浩 on 15/10/22.
//  Copyright © 2015年 蓝鸥科技. All rights reserved.
//

#import <UIKit/UIKit.h>
#define TH_navigationControllerHeight 64
#define TH_columnHeight 44
#define TH_navigationControllerBarHeight 0
//column显示几个 平均分配宽度
#define TH_columnShowCount 0
//如果是自己写的tableView成属性 或者CollectionView 是属性 不是ViewController 自带的 用此方法给Frame
#define TH_ControllerViewFrame CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - TH_navigationControllerHeight - TH_columnHeight - TH_navigationControllerBarHeight)
//Color
#define TH_columnCellColor [UIColor colorWithRed:1 green:1 blue:1 alpha:1]
#define TH_columnCellContentViewColor [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:1]
#define TH_columnCellLabelColor [UIColor colorWithRed:1 green:1 blue:1 alpha:1]
#define TH_columnCellLabelSelectColor [UIColor colorWithRed:1 green:1 blue:1 alpha:1]
#define TH_columnCellLabelTextColor [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:1]
#define TH_columnCellLabelTextSelectColor [UIColor colorWithRed:0.3 green:0.3 blue:0.3 alpha:1]
//Font
#define TH_columnCellLabelFont 15
#define TH_columnCellLabelSelectFont 25
@interface TH_MergeViewController : UIViewController
/*
    如果发生titleArray数量少就会产生崩溃
    如果发生VCArray数量少就会少了titleArray数量
    请保证数组数量一致
*/
//使用此方法创建TH_MergeViewController
- (instancetype)initWithTitleArray:(NSArray *)titleArray withViewControllerArray:(NSArray *)VCArray;
//第一次使用此方法跳转其他ViewController
+ (void)pusViewController:(id)NC isAnimation:(BOOL)isAnimation;
+ (void)popViewControllerIsAnimation:(BOOL)isAnimation;
@end
