//
//  TH_MergeViewController.m
//  MultipleControllersOneControllers
//
//  Created by 童浩 on 15/10/22.
//  Copyright © 2015年 蓝鸥科技. All rights reserved.
//

#import "TH_MergeViewController.h"
#import "TH_modelSingleton.h"
#import "TH_MergeViewTVCell.h"
#import "TH_ColumnTableViewCell.h"
@interface TH_MergeViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)NSMutableArray *VCArray;
@property (nonatomic,strong)NSMutableArray *titleArray;
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)UITableView *columnTableView;
@property (nonatomic,strong)NSIndexPath *scrollIndexPath;
@end

@implementation TH_MergeViewController

- (instancetype)initWithTitleArray:(NSArray *)titleArray withViewControllerArray:(NSArray *)VCArray{
    self = [super init];
    if (self) {
        self.VCArray = [NSMutableArray array];
        [self.VCArray addObjectsFromArray:VCArray];
        self.titleArray = [NSMutableArray array];
        [self.titleArray addObjectsFromArray:titleArray];
    }
    return self;
}

- (UIView *)ControllersRootView:(UIViewController *)Controller{
    UIView *view = Controller.view;
    return view;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    __block TH_MergeViewController *men = self;
    [TH_modelSingleton singleton].block = ^(BOOL isAnimation){
        [men.navigationController popViewControllerAnimated:isAnimation];
    };
    [TH_modelSingleton singleton].pusBlock = ^(BOOL isAnimation, id NC){
        [men.navigationController pushViewController:(UIViewController *)NC animated:isAnimation];
    };
    self.view.backgroundColor = [UIColor whiteColor];
    [self columnTableViewLayout];
    [self tableViewLayout];
    
}
- (void)tableViewLayout{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.height - TH_navigationControllerHeight - TH_columnHeight - TH_navigationControllerBarHeight, [UIScreen mainScreen].bounds.size.width) style:UITableViewStylePlain];
    _tableView.center = CGPointMake([UIScreen mainScreen].bounds.size.width / 2.0, ([UIScreen mainScreen].bounds.size.height + TH_navigationControllerHeight + TH_columnHeight - TH_navigationControllerBarHeight) / 2.0);
    self.tableView.transform = CGAffineTransformMakeRotation(- M_PI_2);
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.showsVerticalScrollIndicator = NO;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
}
- (void)columnTableViewLayout {
    self.columnTableView  = [[UITableView alloc]initWithFrame:CGRectMake(0, 0,TH_columnHeight, [UIScreen mainScreen].bounds.size.width) style:UITableViewStylePlain];
    self.columnTableView.center = CGPointMake([UIScreen mainScreen].bounds.size.width / 2.0, TH_columnHeight / 2.0 + TH_navigationControllerHeight);
    self.columnTableView.transform = CGAffineTransformMakeRotation(- M_PI_2);
    self.columnTableView.delegate = self;
    self.columnTableView.dataSource = self;
    self.columnTableView.showsVerticalScrollIndicator = NO;
    _columnTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.columnTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionMiddle];
    [self columnTableCellSelectIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    [self.view addSubview:self.columnTableView];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _VCArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([tableView isEqual: _tableView]) {
        TH_MergeViewTVCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"th_mergeViewCell"];
        if (!cell) {
            cell = [[TH_MergeViewTVCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"th_mergeViewCell"];
        }
        cell.contentView.transform = CGAffineTransformMakeRotation(M_PI_2);
        UIView *view = [self ControllersRootView:self.VCArray[indexPath.row]];
        [cell addControllerView:view];
        _scrollIndexPath = [NSIndexPath indexPathForRow:indexPath.row inSection:0];
        return cell;
    }else{
        TH_ColumnTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"th_columnViewCell"];
        if (!cell) {
            cell = [[TH_ColumnTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"th_columnViewCell" arrayCount:_VCArray.count];
        }
        cell.contentView.transform = CGAffineTransformMakeRotation(M_PI_2);
        cell.titleStr = _titleArray[indexPath.row];
        return cell;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([tableView isEqual:self.columnTableView]) {
        [self.tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionMiddle];
        [self.columnTableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionMiddle];
        [self columnTableCellSelectIndexPath:indexPath];
    }
}
- (void)scrollToRowAtIndexPath{
    [self.columnTableView selectRowAtIndexPath:_scrollIndexPath animated:YES scrollPosition:UITableViewScrollPositionMiddle];
    [[self tableView] scrollToRowAtIndexPath:_scrollIndexPath atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self columnTableCellSelectIndexPath:_scrollIndexPath];
    });
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if ([(UITableView *)scrollView isEqual: _tableView]) {
        [self scrollToRowAtIndexPath];
    }
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    if ([(UITableView *)scrollView isEqual: _tableView]) {
        [self scrollToRowAtIndexPath];
    }
}

- (void)columnTableCellSelectIndexPath:(NSIndexPath *)indexPath{
    for (TH_ColumnTableViewCell *cella in [self.columnTableView visibleCells]) {
        cella.label.backgroundColor = TH_columnCellLabelColor;
        cella.label.textColor = TH_columnCellLabelTextColor;
        cella.label.font = [UIFont systemFontOfSize:TH_columnCellLabelFont];
    }
    TH_ColumnTableViewCell *cell = [self.columnTableView cellForRowAtIndexPath:indexPath];
    cell.label.font = [UIFont systemFontOfSize:TH_columnCellLabelSelectFont];
    cell.label.textColor = TH_columnCellLabelTextSelectColor;
    cell.label.backgroundColor = TH_columnCellLabelSelectColor;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([tableView isEqual:self.columnTableView]) {
        if (TH_columnShowCount) {
            return [UIScreen mainScreen].bounds.size.width / TH_columnShowCount;
        }
        switch (self.VCArray.count) {
            case 1:
                return [UIScreen mainScreen].bounds.size.width;
                break;
            case 2:
                return [UIScreen mainScreen].bounds.size.width / 2.0;
                break;
            case 3:
                return [UIScreen mainScreen].bounds.size.width / 3.0;
                break;
            default:
                return [UIScreen mainScreen].bounds.size.width / 3.0;
                break;
        }
    }
    return [UIScreen mainScreen].bounds.size.width;
}
+ (void)pusViewController:(id)NC isAnimation:(BOOL)isAnimation{
    if ([TH_modelSingleton singleton].pusBlock) {
        [TH_modelSingleton singleton].pusBlock(isAnimation,NC);
    }
}
+ (void)popViewControllerIsAnimation:(BOOL)isAnimation{
    if ([TH_modelSingleton singleton].block) {
        [TH_modelSingleton singleton].block(isAnimation);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
