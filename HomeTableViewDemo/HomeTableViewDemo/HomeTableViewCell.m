//
//  HomeTableViewCell.m
//  HomeTableViewDemo
//
//  Created by 李龙 on 16/3/28.
//  Copyright © 2016年 李龙. All rights reserved.
//

#import "HomeTableViewCell.h"
#import "config.h"
#import "LeftTableView.h"
#import "RightCollectionView.h"


@interface HomeTableViewCell ()
@property (nonatomic,strong) UILabel *myLbale;

@property (nonatomic,strong) UIView *myADView;
@property (nonatomic,strong) UIButton *leftMenuBtn;
@property (nonatomic,strong) UIButton *rightMenuBtn;
@property (nonatomic,strong) UIScrollView *myScrollView;

@end


@implementation HomeTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        
        NSLog(@"%s",__FUNCTION__);
        
        _myADView = ({
            UIView *view = [UIView new];
            view.backgroundColor = [UIColor redColor];
            [self addSubview:view];
            view;
        });
        
        
        _leftMenuBtn = ({
            UIButton *btn = [UIButton new];
            [btn setTitle:@"音乐" forState:UIControlStateNormal];
            btn.backgroundColor = [UIColor greenColor];
            [self addSubview:btn];
            btn;
        });
    
        _rightMenuBtn = ({
            UIButton *btn = [UIButton new];
            [btn setTitle:@"电影" forState:UIControlStateNormal];
            btn.backgroundColor = [UIColor blueColor];
            [self addSubview:btn];
            btn;
        });
        
        
        _myScrollView = ({
        
            UIScrollView *scrollView = [UIScrollView new];
            scrollView.backgroundColor = [UIColor cyanColor];
            scrollView.pagingEnabled = YES;
            
            [self addScrollViewSubViews:scrollView];//添加子控件
            
            [self addSubview:scrollView];
            scrollView;
        
        });
        

        
        
        
    }
    
    return self;
}


- (void)addScrollViewSubViews:(UIScrollView *)scrollView{
    
    LeftTableView *leftView = [LeftTableView new];
    leftView.backgroundColor = [UIColor lightGrayColor];
    leftView.frame = CGRectMake(0, 0, LLkeyWindowsSize.width, 500);
    
    CGFloat leftTableViewHeight = leftView.tableView.contentSize.height;
    NSLog(@"leftTableViewHeight: %f",leftTableViewHeight);
    NSLog(@"leftView.tableView: %f",leftView.tableView.height);
    
    RightCollectionView *rightView = [RightCollectionView new];
    rightView.backgroundColor = [UIColor yellowColor];
    rightView.frame = CGRectMake(LLkeyWindowsSize.width, 0, LLkeyWindowsSize.width, 500);
    
    [scrollView addSubview:leftView];
    [scrollView addSubview:rightView];
}




-(void)layoutSubviews{
    [super layoutSubviews];
    NSLog(@"%s",__FUNCTION__);
    NSLog(@"");
    
    _myADView.frame = CGRectMake(0, 0, LLkeyWindowsSize.width, 100);
    _leftMenuBtn.frame = CGRectMake(0, _myADView.buttom, LLkeyWindowsSize.width*0.5, 40);
    _rightMenuBtn.frame = CGRectMake(_leftMenuBtn.right, _myADView.buttom, LLkeyWindowsSize.width*0.5, 40);
    NSLog(@"%f",_leftMenuBtn.buttom);
    _myScrollView.frame = CGRectMake(0, _leftMenuBtn.buttom, LLkeyWindowsSize.width, LLkeyWindowsSize.height-_leftMenuBtn.buttom);
    _myScrollView.contentSize = CGSizeMake(LLkeyWindowsSize.width*2, 500);
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
