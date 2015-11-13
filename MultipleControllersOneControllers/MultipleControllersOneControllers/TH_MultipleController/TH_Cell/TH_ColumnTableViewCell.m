//
//  TH_ColumnTableViewCell.m
//  MultipleControllersOneControllers
//
//  Created by 童浩 on 15/11/13.
//  Copyright © 2015年 蓝鸥科技. All rights reserved.
//

#import "TH_ColumnTableViewCell.h"
#import "TH_MergeViewController.h"
@interface TH_ColumnTableViewCell()

@end

@implementation TH_ColumnTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier arrayCount:(NSInteger)arrayCount{
    CGFloat arrayFloat = 0.0;
    switch (arrayCount) {
        case 1:
            arrayFloat = [UIScreen mainScreen].bounds.size.width;
            break;
        case 2:
            arrayFloat = [UIScreen mainScreen].bounds.size.width / 2.0;
            break;
        case 3:
            arrayFloat = [UIScreen mainScreen].bounds.size.width / 3.0;
            break;
        default:
            arrayFloat = [UIScreen mainScreen].bounds.size.width / 3.0;
            break;
    }
    if (TH_columnShowCount) {
        arrayFloat = [UIScreen mainScreen].bounds.size.width / TH_columnShowCount;
    }
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _label = [[UILabel alloc]initWithFrame:CGRectMake(2, 2,arrayFloat - 4, TH_columnHeight - 4)];
        self.contentView.backgroundColor = TH_columnCellContentViewColor;
        _label.textAlignment = NSTextAlignmentCenter;
        _label.textColor = TH_columnCellLabelTextColor;
        _label.backgroundColor = TH_columnCellLabelColor;
        _label.font = [UIFont systemFontOfSize:TH_columnCellLabelFont];
        _label.layer.masksToBounds = YES;
        _label.layer.cornerRadius = 15;
        self.contentView.layer.masksToBounds = YES;
        self.contentView.layer.cornerRadius = 15;
        [self.contentView addSubview:_label];
        self.backgroundColor = TH_columnCellColor;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}


- (void)awakeFromNib {
    // Initialization code
}
- (void)setTitleStr:(NSString *)titleStr{
    if (titleStr) {
        _titleStr = titleStr;
    }
    _label.text = titleStr;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
