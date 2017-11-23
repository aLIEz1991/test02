//
//  CakeViewController.m
//  azTest2
//
//  Created by DYG_Az on 2017/11/22.
//  Copyright © 2017年 DYG_Az. All rights reserved.
//

#import "CakeViewController.h"
#import "CakeDetailViewController.h"

@interface CakeViewController ()

@end

@implementation CakeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[self view] setBackgroundColor:[UIColor purpleColor]];
    
    UIButton * jumpTo = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, 100, 100)];
    [jumpTo setBackgroundColor:[UIColor whiteColor]];
    [jumpTo addTarget:self action:@selector(jumpToDetail:) forControlEvents:UIControlEventTouchUpInside];
    [[self view] addSubview:jumpTo];
    
}

- (void) jumpToDetail:(UIButton *)sender {
    
    CakeDetailViewController * vc = [[CakeDetailViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    
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
