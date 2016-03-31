//
//  ViewController.m
//  HomeTableViewDemo
//
//  Created by 李龙 on 16/3/28.
//  Copyright © 2016年 李龙. All rights reserved.
//

#import "ViewController.h"
#import "HomeTableViewCell.h"
#import "config.h"


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,HomeTableViewCellDelegate>{
    CGFloat tableViewCellgheight;
    
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

@implementation ViewController

static NSString *const cellID = @"HomeTableViewCell";


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.tableView registerClass:[HomeTableViewCell class] forCellReuseIdentifier:cellID];
    self.tableView.allowsSelection = NO;
    self.tableView.tableFooterView = [UIView new];
    
    
    tableViewCellgheight = LLkeyWindowsSize.height;
    
}


#pragma mark UITableViewDataSourece
-(NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HomeTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
    cell.delegate = self;
    cell.textLabel.text = @"cell";
    cell.backgroundColor = [UIColor cyanColor];
    return cell;
}


//如果重写了这个方法之后,那么自定义Cell中的layoutSubViews这个方法会再调用一次
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return tableViewCellgheight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%s",__FUNCTION__);
    [self.tableView reloadData];
}




- (CGFloat)getTableViewCellgheight:(CGFloat)height{
    
    if (height < LLkeyWindowsSize.height) {
        return LLkeyWindowsSize.height;
    }
    
    return height;
}




#pragma mark HomeTableViewCellDelegate
-(void)homeTableViewCell:(HomeTableViewCell *)cell withScrollViewHeight:(CGFloat)scrollViewHeight{
    tableViewCellgheight = [self getTableViewCellgheight:scrollViewHeight];
    LxDBAnyVar(@"----------------------------");
    LxDBAnyVar(tableViewCellgheight);
//    [self.tableView reloadData];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
