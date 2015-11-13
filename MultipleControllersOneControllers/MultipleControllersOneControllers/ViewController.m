//
//  ViewController.m
//  MultipleControllersOneControllers
//
//  Created by 童浩 on 15/10/22.
//  Copyright © 2015年 蓝鸥科技. All rights reserved.
//

#import "ViewController.h"
#import "MultipleTableViewController.h"
#import "THTHTHTableViewController.h"
#import "OneViewController.h"
#import "TH_MultipleController/TH_MergeViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (IBAction)pusVC:(UIButton *)sender {
    
    NSArray *vcArray = @[[MultipleTableViewController new],[THTHTHTableViewController new],[OneViewController new],[THTHTHTableViewController new],[MultipleTableViewController new],[MultipleTableViewController new]];
    NSArray *titleArray = @[@"1",@"2",@"3",@"4",@"5",@"6"];
    TH_MergeViewController *th_MergeVC = [[TH_MergeViewController alloc]initWithTitleArray:titleArray withViewControllerArray:vcArray];
    th_MergeVC.title = @"TH_MergeViewController";
    [self.navigationController pushViewController:th_MergeVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
