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
    
    [[[[self navigationItem] leftBarButtonItem] customView] setHidden:NO];
    
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