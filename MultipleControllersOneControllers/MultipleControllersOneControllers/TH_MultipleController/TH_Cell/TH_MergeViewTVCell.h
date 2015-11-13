//
//  TH_MergeViewTVCell.h
//  MultipleControllersOneControllers
//
//  Created by 童浩 on 15/10/22.
//  Copyright © 2015年 蓝鸥科技. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TH_MergeViewController.h"


@interface TH_MergeViewTVCell : UITableViewCell

@property (nonatomic, strong)UIView *mergeView;

- (void)addControllerView:(UIView *)view;

@end
