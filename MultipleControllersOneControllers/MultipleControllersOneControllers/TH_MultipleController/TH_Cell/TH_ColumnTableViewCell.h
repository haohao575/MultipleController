//
//  TH_ColumnTableViewCell.h
//  MultipleControllersOneControllers
//
//  Created by 童浩 on 15/11/13.
//  Copyright © 2015年 蓝鸥科技. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TH_ColumnTableViewCell : UITableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier arrayCount:(NSInteger)arrayCount;
@property (nonatomic, strong)NSString *titleStr;
@property (nonatomic, strong)UILabel *label;
@end
