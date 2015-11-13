//
//  TH_MergeViewTVCell.m
//  MultipleControllersOneControllers
//
//  Created by 童浩 on 15/10/22.
//  Copyright © 2015年 蓝鸥科技. All rights reserved.
//

#import "TH_MergeViewTVCell.h"

@implementation TH_MergeViewTVCell

- (void)awakeFromNib {
    // Initialization code
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self lodeView];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}
- (void)lodeView{
    self.mergeView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - TH_navigationControllerHeight - TH_columnHeight - TH_navigationControllerBarHeight)];
    [self.contentView addSubview:self.mergeView];
}
- (void)addControllerView:(UIView *)view{
    view.frame = self.mergeView.frame;
    [self.mergeView addSubview: view];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
