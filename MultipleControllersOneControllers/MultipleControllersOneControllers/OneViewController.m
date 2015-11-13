//
//  OneViewController.m
//  MultipleControllersOneControllers
//
//  Created by 童浩 on 15/10/23.
//  Copyright © 2015年 蓝鸥科技. All rights reserved.
//

#import "OneViewController.h"
#import "TH_MergeViewController.h"


@interface OneViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong)UITableView *tab;

@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tab = [[UITableView alloc]initWithFrame:TH_ControllerViewFrame style:UITableViewStylePlain];
    self.tab.delegate = self;
    self.tab.dataSource = self;
    self.view.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.tab];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 15;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [self.tab dequeueReusableCellWithIdentifier:@"ccc"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ccc"];
    }
    cell.textLabel.text = @"ccc";
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
