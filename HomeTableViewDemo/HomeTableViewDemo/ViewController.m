//
//  ViewController.m
//  HomeTableViewDemo
//
//  Created by 李龙 on 16/3/28.
//  Copyright © 2016年 李龙. All rights reserved.
//

#import "ViewController.h"
#import "HomeTableViewCell.h"

@interface ViewController ()<UITabBarDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

@implementation ViewController

static NSString *const cellID = @"HomeTableViewCell";


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    //    [self.tableView registerNib:[UINib nibWithNibName:@"HomeTableViewCell" bundle:nil] forCellReuseIdentifier:cellID];
    [self.tableView registerClass:[HomeTableViewCell class] forCellReuseIdentifier:cellID];
    self.tableView.tableFooterView = [UIView new];
    
}


#pragma mark UITableViewDataSourece
-(NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HomeTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    

    cell.textLabel.text = @"cell";
    
    return cell;
}


//如果重写了这个方法之后,那么自定义Cell中的layoutSubViews这个方法会再调用一次
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 500;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
