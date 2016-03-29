//
//  LeftTableView.m
//  HomeTableViewDemo
//
//  Created by 李龙 on 16/3/28.
//  Copyright © 2016年 李龙. All rights reserved.
//

#import "LeftTableView.h"
#import "config.h"
@interface LeftTableView ()<UITableViewDelegate,UITableViewDataSource>

@end


@implementation LeftTableView

static NSString *const CellID = @"CellID";
static CGFloat const tabelViewCellHeight = 40.f;
static int const tableViewRowOfNumber= 3;

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        NSLog(@"%s",__FUNCTION__);
        
        [self initSubView];
        
    }
    return self;
}


-(void)awakeFromNib{
    NSLog(@"%s",__FUNCTION__);
}


- (void)initSubView{
    _tableViewHeight = tableViewRowOfNumber*tabelViewCellHeight;
    
    _tableView = ({
        
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, LLkeyWindowsSize.width, _tableViewHeight) style:UITableViewStylePlain];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.bounces = NO;

        [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellID];
        [self addSubview:tableView];
        
        tableView;
    });
}


#pragma mark UItableViewDelegate && UITableViewDataSource
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    return 3;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:CellID forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"LeftTableView:%zd",indexPath.row];
    cell.backgroundColor = [UIColor orangeColor];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return tabelViewCellHeight;
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"LeftTableView 点击了 %zd",indexPath.row);
}


@end
