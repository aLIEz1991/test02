//
//  ChattingViewController.m
//  azTest2
//
//  Created by DYG_Az on 2017/11/21.
//  Copyright © 2017年 DYG_Az. All rights reserved.
//

#import "ChattingViewController.h"
#import "CakeViewController.h"
#import "BreadViewController.h"
#import "ChinaViewController.h"

@interface ChattingViewController ()

@property (strong, nonatomic) UIViewController *firstVC;
@property (strong, nonatomic) UIViewController *secondVC;
@property (strong, nonatomic) UIViewController *thirdVC;
@property (strong, nonatomic) UISegmentedControl * segment;

@end

@implementation ChattingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //左侧按钮 显示
//    [[[[self navigationItem] leftBarButtonItem] customView] setHidden:NO];
    
    // 分段式选择器 Segment
    NSArray * array = [NSArray arrayWithObjects:Cake, Bread, Chinese, nil];
    _segment = [[UISegmentedControl alloc] initWithItems:array];
    // 修改标题(根据下标定位修改)
//    [_segment setTitle:@"Cake" forSegmentAtIndex:0];
    
    // 根据内容定分段器的宽度
//    [_segment setApportionsSegmentWidthsByContent:YES];
    
    // 按下自动释放 (默认为NO,不被选中状态)
//    [_segment setMomentary:YES];
    
    // 渲染色
    [_segment setTintColor:titleColor];
    
    //添加子控制器 默认点击
    _firstVC = [[CakeViewController alloc] init];
    [_firstVC.view setFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - TabHeight)];
    [self addChildViewController:_firstVC];
    
    _secondVC = [[BreadViewController alloc] init];
    [_secondVC.view setFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - TabHeight - NavHeight)];
    [self addChildViewController:_secondVC];
    
    _thirdVC = [[ChinaViewController alloc] init];
    [_thirdVC.view setFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - TabHeight - NavHeight)];
    [self addChildViewController:_thirdVC];
    
    // 添加点击事件 UIControlEventValueChanged
    [_segment addTarget:self action:@selector(segmentClick:) forControlEvents:UIControlEventValueChanged];
    
    //标题设置为选择器
    [[self navigationItem] setTitleView:_segment];
    
    // 开始时默认选中的下标(0开始)
    [_segment setSelectedSegmentIndex:0];
    // 默认点击
    [self segmentClick:_segment];
    
}


#pragma mark -- Segment 点击事件
- (void)segmentClick:(UISegmentedControl *) sender {
    
    if (sender.selectedSegmentIndex == 0) {
        
        [[self view] addSubview:_firstVC.view];
    
    } else if (sender.selectedSegmentIndex == 1) {
        
        [[self view] addSubview:_secondVC.view];
        
    } else if (sender.selectedSegmentIndex == 2) {
        
        [[self view] addSubview:_thirdVC.view];
        
    }
    
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
