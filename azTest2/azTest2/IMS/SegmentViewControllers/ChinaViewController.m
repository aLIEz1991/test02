//
//  ChinaViewController.m
//  azTest2
//
//  Created by DYG_Az on 2017/11/22.
//  Copyright © 2017年 DYG_Az. All rights reserved.
//

#import "ChinaViewController.h"

@interface ChinaViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UITableView * cTabel;

@end

@implementation ChinaViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[self view] setBackgroundColor:[UIColor yellowColor]];
    
    _cTabel.delegate = self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return nil;
    
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
    
}


@end
