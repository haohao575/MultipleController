//
//  AddViewViewController.m
//  MultipleControllersOneControllers
//
//  Created by 童浩 on 15/11/20.
//  Copyright © 2015年 蓝鸥科技. All rights reserved.
//

#import "AddViewViewController.h"

@interface AddViewViewController ()

@end

@implementation AddViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSInteger red = arc4random() % 255;
    NSInteger green = arc4random() % 255;
    NSInteger blue = arc4random() % 255;
//    NSInteger red = arc4random() % 255;
    self.view.backgroundColor = [UIColor colorWithRed:red / 255.0 green:green / 255.0 blue:blue / 255.0 alpha:1];
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
