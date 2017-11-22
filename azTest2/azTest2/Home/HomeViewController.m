//
//  HomeViewController.m
//  azTest2
//
//  Created by DYG_Az on 2017/11/16.
//  Copyright © 2017年 DYG_Az. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@property ( strong , nonatomic) UIScrollView * scrollView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[self navigationItem] setTitle:Home];
    
    //button view
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH)];
    [_scrollView setBackgroundColor:[UIColor brownColor]];
    
     UIView * btnView = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_WIDTH, SCREEN_WIDTH, SCREEN_HEIGHT - NavHeight - TabHeight - SCREEN_WIDTH)];
    
    [[self view] addSubview:btnView];
    [[self view] addSubview:_scrollView];
    
    //btn frame
    UIButton * firstBtn = [[UIButton alloc] initWithFrame:CGRectMake(Margin, Margin, (btnView.frame.size.width - Margin * 3) / 2, (btnView.frame.size.height - Margin * 3) / 2)];
    
    UIButton * secondBtn = [[UIButton alloc] initWithFrame:CGRectMake(Margin / 2 + SCREEN_WIDTH / 2, Margin, (btnView.frame.size.width - Margin * 3) / 2, (btnView.frame.size.height - Margin * 3) / 2)];
    
    UIButton * thirdBtn = [[UIButton alloc] initWithFrame:CGRectMake(Margin, btnView.frame.size.height / 2 + Margin / 2,(btnView.frame.size.width - Margin * 3) / 2, (btnView.frame.size.height - Margin * 3) / 2)];
    
    UIButton * fourthBtn = [[UIButton alloc] initWithFrame:CGRectMake(Margin / 2 + SCREEN_WIDTH / 2, btnView.frame.size.height / 2 + Margin / 2,(btnView.frame.size.width - Margin * 3) / 2, (btnView.frame.size.height - Margin * 3) / 2)];
    
    //设置Btn
    [firstBtn setBackgroundColor:[UIColor redColor]];
    [secondBtn setBackgroundColor:[UIColor orangeColor]];
    [thirdBtn setBackgroundColor:[UIColor blueColor]];
    [fourthBtn setBackgroundColor:[UIColor purpleColor]];
    
    
    [btnView addSubview:firstBtn];
    [btnView addSubview:secondBtn];
    [btnView addSubview:thirdBtn];
    [btnView addSubview:fourthBtn];
    
    
}

// 初始化轮播图片
- (void) initScrollView {
    
    
    
}


- (void) menuBtnClick : (UIButton *) sender {
    
    
    
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
