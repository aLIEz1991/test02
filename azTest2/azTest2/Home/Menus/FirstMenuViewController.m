//
//  FirstMenuViewController.m
//  azTest2
//
//  Created by DYG_Az on 2017/11/23.
//  Copyright © 2017年 DYG_Az. All rights reserved.
//

#import "FirstMenuViewController.h"

@interface FirstMenuViewController ()

@end

@implementation FirstMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[self navigationItem] setTitle:@"Creat Note"];
    
    [[[[self navigationItem] leftBarButtonItem] customView] setHidden:NO];
    
    //定义右侧按钮
    UIButton * rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 40, 17, 30, 30)];
    [rightBtn setImage:[UIImage imageNamed:@"manager"] forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(save:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * barBtnRight = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    [[self navigationItem] setRightBarButtonItem:barBtnRight];
    
}

#pragma mark -- 初始化页面
- (void) initFirstView {
    
    
    
}

#pragma mark -- 保存
- (void) save:(UIButton *)sender {
    
    
    
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
