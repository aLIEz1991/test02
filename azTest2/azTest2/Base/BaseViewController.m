//
//  BaseViewController.m
//  azTest2
//
//  Created by DYG_Az on 2017/11/16.
//  Copyright © 2017年 DYG_Az. All rights reserved.
//

#import "BaseViewController.h"
#import "UIImage+Extend.h"
#import "LocalizationManager.h"
#import "HomeViewController.h"

@interface BaseViewController ()<UIAlertViewDelegate>

@property (strong, nonatomic) UILabel * test;

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //定义Nav颜色
    [[[self navigationController] navigationBar] setBackgroundImage:[UIImage getImageWithColor:[UIColor brownColor] size:CGSizeMake(self.view.frame.size.height, 64)] forBarMetrics:UIBarMetricsDefault];
    
    //定义标题字体
    [[[self navigationController] navigationBar] setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20.f]}];
    [[[self navigationController] navigationBar] setTitleTextAttributes:@{NSForegroundColorAttributeName:titleColor}];
  
    //定义左侧按钮
    UIButton * leftBtn = [[UIButton alloc] initWithFrame:CGRectMake(10, 17, 30, 30)];
    [leftBtn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(backForPop) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * barBtnLeft = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    [[self navigationItem] setLeftBarButtonItem:barBtnLeft];
    
    [[[[self navigationItem] leftBarButtonItem] customView] setHidden:YES];
    
    [[self view] setBackgroundColor:[UIColor whiteColor]];
    
    
    /**
    
//    NSString * testText = NSLocalizedString(@"title", nil);//系统
    NSString * testText = [LocalizationManager getStringByKey:@"title"];
    
    [[self navigationItem] setTitle:testText];
    
    _test = [[UILabel alloc] initWithFrame:CGRectMake(100, 300, 150, 30)];
    [_test setText:testText];
    [_test setBackgroundColor:[UIColor brownColor]];
    [[self view] addSubview:_test];
    
    UIButton * changeLanguageEn = [[UIButton alloc] initWithFrame:CGRectMake(100, 350, 150, 30)];
    [changeLanguageEn setTitle:@"切换en" forState:UIControlStateNormal];
    [changeLanguageEn setBackgroundColor:[UIColor greenColor]];
    [changeLanguageEn addTarget:self action:@selector(changeToEn) forControlEvents:UIControlEventTouchUpInside];
    [[self view] addSubview:changeLanguageEn];
    
    UIButton * changeLanguageChS = [[UIButton alloc] initWithFrame:CGRectMake(100, 400, 150, 30)];
    [changeLanguageChS setTitle:@"切换中文简体" forState:UIControlStateNormal];
    [changeLanguageChS setBackgroundColor:[UIColor greenColor]];
    [changeLanguageChS addTarget:self action:@selector(changeToCHS) forControlEvents:UIControlEventTouchUpInside];
    [[self view] addSubview:changeLanguageChS];
    
    UIButton * changeLanguageChT = [[UIButton alloc] initWithFrame:CGRectMake(100, 450, 150, 30)];
    [changeLanguageChT setTitle:@"切换中文繁体" forState:UIControlStateNormal];
    [changeLanguageChT setBackgroundColor:[UIColor greenColor]];
    [changeLanguageChT addTarget:self action:@selector(changeToCHT) forControlEvents:UIControlEventTouchUpInside];
    [[self view] addSubview:changeLanguageChT];
    
    */
}

//返回按钮PoP事件
- (void) backForPop {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




/**
 #pragma mark -- 切换语言
 - (void) changeToEn {
 
 [LocalizationManager setUserlanguage:@"en"];
 NSString * testText = [LocalizationManager getStringByKey:@"title"];
 [_test setText:testText];
 }
 
 
 - (void) changeToCHS {
 
 //    [LocalizationManager setUserlanguage:@"zh-Hans"];
 //    NSString * testText = [LocalizationManager getStringByKey:@"title"];
 //    [_test setText:testText];
 
 UIAlertView * alertView2 = [[UIAlertView alloc] initWithTitle:@"下线" message:@"mmpmmpmmpmmpmmp" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"Done", nil];
 [alertView2 show];
 
 }
 
 
 - (void) changeToCHT {
 
 //    [LocalizationManager setUserlanguage:@"zh-Hant"];
 //    NSString * testText = [LocalizationManager getStringByKey:@"title"];
 //    [_test setText:testText];
 
 UIAlertView * alertView1 = [[UIAlertView alloc] initWithTitle:@"test1" message:nil delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"Done", nil];
 [alertView1 show];
 }
 
 
 #pragma mark -- UIAlertView点击事件
 - (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
 
 if (buttonIndex == 0) {
 
 if ([alertView.title isEqualToString:@"下线"]) {
 
 [_test setBackgroundColor:[UIColor blueColor]];
 
 } else {
 
 [_test setBackgroundColor:[UIColor redColor]];
 
 }
 
 } else if(buttonIndex == 1) {
 
 [_test setBackgroundColor:[UIColor orangeColor]];
 
 }
 
 }
 */

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
