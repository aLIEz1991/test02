//
//  HomeViewController.m
//  azTest2
//
//  Created by DYG_Az on 2017/11/16.
//  Copyright © 2017年 DYG_Az. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()<UIScrollViewDelegate>

@property ( strong , nonatomic) UIScrollView * scrollView;
@property ( strong , nonatomic) UIButton * firstBtn;
@property ( strong , nonatomic) UIButton * secondBtn;
@property ( strong , nonatomic) UIButton * thirdBtn;
@property ( strong , nonatomic) UIButton * fourthBtn;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 标题
    [[self navigationItem] setTitle:Home];
    
    //轮播图区域
    [self initScrollView];
    
    //btn区域
    [self initBtnView];
    
}

#pragma mark -- 初始化轮播图片
- (void) initScrollView {
    
    // delegate
    _scrollView.delegate = self;
    // view frame
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH)];
    [_scrollView setBackgroundColor:[UIColor brownColor]];
    //add
    [[self view] addSubview:_scrollView];
    
    /*** 设置scrollView ***/
    int imgCount = 3; // 图片数
    //    CGFloat gap = 10.f; // 图片缝隙间距
    // 滚动范围
    [_scrollView setContentSize:CGSizeMake(SCREEN_WIDTH * imgCount, SCREEN_WIDTH)];
    // 分页
    [_scrollView setPagingEnabled:YES];
    //子视图的显示范围 默认裁剪Y
    [_scrollView setClipsToBounds:NO];
    //隐藏滚动条
    [_scrollView setShowsHorizontalScrollIndicator:NO];
    
    //循环添加轮播图片,图片名称规律scrollImg0~n
    for (int i = 0; i < imgCount; i ++ ) {
        
        //定义轮播图片
        UIImageView * scrollImgV = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * i, 0, SCREEN_WIDTH, SCREEN_WIDTH)];
        [scrollImgV setImage:[UIImage imageNamed:[NSString stringWithFormat:@"scrollImg%d",i]]];
        
        //定义文字半透明区域
        UIView * textView = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * i, SCREEN_WIDTH * 2 / 3, SCREEN_WIDTH, SCREEN_WIDTH / 3)];
        [textView setBackgroundColor:[UIColor colorWithWhite:1.f alpha:.25f]];
        
        // labels 上下
        UILabel * ImgLabelup = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * i + 10, SCREEN_WIDTH * 2 / 3, SCREEN_WIDTH - 20, SCREEN_WIDTH / 6)];
        UILabel * ImgLabeldown = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * i + 10, SCREEN_WIDTH * 5 / 6, SCREEN_WIDTH - 20, SCREEN_WIDTH / 6)];

        //add
        [_scrollView addSubview:scrollImgV];
        [_scrollView addSubview:textView];
        [_scrollView addSubview:ImgLabelup];
        [_scrollView addSubview:ImgLabeldown];
    }
    
}


#pragma mark -- 初始化buttonView
- (void) initBtnView {
    
    // view frame
    UIView * btnView = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_WIDTH, SCREEN_WIDTH, SCREEN_HEIGHT - NavHeight - TabHeight - SCREEN_WIDTH)];
    
    // add view
    [[self view] addSubview:btnView];
    
    // Btns frame
    _firstBtn = [[UIButton alloc] initWithFrame:CGRectMake(Margin, Margin, (btnView.frame.size.width - Margin * 3) / 2, (btnView.frame.size.height - Margin * 3) / 2)];
    
    _secondBtn = [[UIButton alloc] initWithFrame:CGRectMake(Margin / 2 + SCREEN_WIDTH / 2, Margin, (btnView.frame.size.width - Margin * 3) / 2, (btnView.frame.size.height - Margin * 3) / 2)];
    
    _thirdBtn = [[UIButton alloc] initWithFrame:CGRectMake(Margin, btnView.frame.size.height / 2 + Margin / 2,(btnView.frame.size.width - Margin * 3) / 2, (btnView.frame.size.height - Margin * 3) / 2)];
    
    _fourthBtn = [[UIButton alloc] initWithFrame:CGRectMake(Margin / 2 + SCREEN_WIDTH / 2, btnView.frame.size.height / 2 + Margin / 2,(btnView.frame.size.width - Margin * 3) / 2, (btnView.frame.size.height - Margin * 3) / 2)];
    
    /**设置Btn属性**/
    // color
    [_firstBtn setBackgroundColor:[UIColor redColor]];
    [_secondBtn setBackgroundColor:[UIColor orangeColor]];
    [_thirdBtn setBackgroundColor:[UIColor blueColor]];
    [_fourthBtn setBackgroundColor:[UIColor purpleColor]];
    
    // click
    [_firstBtn addTarget:self action:@selector(menuBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [_secondBtn addTarget:self action:@selector(menuBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [_thirdBtn addTarget:self action:@selector(menuBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [_fourthBtn addTarget:self action:@selector(menuBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    //add btn
    [btnView addSubview:_firstBtn];
    [btnView addSubview:_secondBtn];
    [btnView addSubview:_thirdBtn];
    [btnView addSubview:_fourthBtn];
    
    
}

#pragma mark -- 菜单按钮点击事件
- (void) menuBtnClick : (UIButton *) sender {
    
    if (sender == _firstBtn) {
        
        NSLog(@"Success:1");
        
    } else if (sender == _secondBtn) {
        
        NSLog(@"Success:2");
        
    } else if (sender == _thirdBtn) {
        
        NSLog(@"Success:3");
        
    } else if (sender == _fourthBtn) {
        
        NSLog(@"Success:4");
        
    } else {
        
        NSLog(@"Error:No Button");
        
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
