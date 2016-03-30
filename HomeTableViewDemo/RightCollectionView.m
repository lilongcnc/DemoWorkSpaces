//
//  RightCollectionView.m
//  HomeTableViewDemo
//
//  Created by 李龙 on 16/3/28.
//  Copyright © 2016年 李龙. All rights reserved.
//

#import "RightCollectionView.h"
#import "config.h"


@interface RightCollectionView ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong) UICollectionView *collectionView;
@end

@implementation RightCollectionView

#define LLVerticalCellWidth [UIScreen mainScreen].bounds.size.width*0.5-5
static CGFloat const headerViewHeight = 33.f;
static CGFloat const itemSizeH = 179.f;

static NSInteger const sectionNum = 3;
static NSInteger const rowNumOfSectionNum = 5;
static NSString *const cellID = @"UICollectionViewCell";

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        [self initSubViews];
    }
    
    
    return self;
}


- (void)initSubViews{
    
    
    _collectionViewHeight = rowNumOfSectionNum*itemSizeH;
    
    
    _collectionView = ({
        //UICollectionViewLayout
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
        flowLayout.itemSize = CGSizeMake(LLVerticalCellWidth,itemSizeH); //不加这个报自动布局的错误~~~~~!!!
        

        
        
        //UICollectionView
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, LLkeyWindowsSize.width, _collectionViewHeight) collectionViewLayout:flowLayout];
        collectionView.backgroundColor = [UIColor darkGrayColor];
        collectionView.showsVerticalScrollIndicator = NO;
        
        collectionView.delegate = self;
        collectionView.dataSource = self;
        
        
        [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:cellID];
        
        
        
        // 每一行中每个cell之间的间距
//        flowLayout.minimumInteritemSpacing = 3; //这里直接用xMargin不行???
        // 每一行之间的间距
        flowLayout.minimumLineSpacing = 3;
        
        
        [self addSubview:collectionView];
        collectionView;
    });
    
    
}


//UICollectionViewDelegate & UICollectionDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return sectionNum;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return rowNumOfSectionNum;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    cell.backgroundColor = [UIColor orangeColor];
    
    return cell;
    
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    
    
    
}

@end
