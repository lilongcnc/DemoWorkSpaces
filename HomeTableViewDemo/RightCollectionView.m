//
//  RightCollectionView.m
//  HomeTableViewDemo
//
//  Created by 李龙 on 16/3/28.
//  Copyright © 2016年 李龙. All rights reserved.
//

#import "RightCollectionView.h"
#import "config.h"


@interface RightCollectionView ()<UICollectionViewDelegate,UICollectionViewDataSource>{
    CGFloat LLVerticalCellWidth;
}

@property (nonatomic,strong) UICollectionView *collectionView;
@end

@implementation RightCollectionView

static CGFloat const headerViewHeight = 33.f;
static CGFloat const itemSizeH = 179.f;
static CGFloat const itemMarginHorizontal = 2.f;
static CGFloat const itemMarginVertical = 2.f;
static CGFloat const sectionInsetTop = 5.f;




static NSInteger const sectionNum = 3;
static NSInteger const rowNumOfSectionNum = 3;
static NSString *const cellID = @"UICollectionViewCell";

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        [self initvalues];
        [self initSubViews];
    }
    
    
    return self;
}


-(void)initvalues{
    
    LLVerticalCellWidth = ([UIScreen mainScreen].bounds.size.width-itemMarginVertical)*0.5;
    
    int eachRowNum = 2;
    
    //TODO 这里实际是应该用for计算每个sectin下的rowNum,每个section下的row是不固定的,而且sectionHeader有的话,高度也需要考虑进去
    int numRowOnfOneSection = (rowNumOfSectionNum+1)/eachRowNum;
    _collectionViewHeight = sectionInsetTop*sectionNum + numRowOnfOneSection*itemSizeH*sectionNum + (numRowOnfOneSection-1)*itemMarginHorizontal*sectionNum;
    
    
//    LxDBAnyVar(_collectionViewHeight);
}

- (void)initSubViews{
    
    
    
    
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
        flowLayout.minimumInteritemSpacing = itemMarginVertical; //这里直接用xMargin不行???
//        // 每一行之间的间距
        flowLayout.minimumLineSpacing = itemMarginHorizontal;
        //设置section之间的间距
        flowLayout.sectionInset = UIEdgeInsetsMake(sectionInsetTop, 0, 0, 0);
        
        [self addSubview:collectionView];
        collectionView;
    });
    
    
}

#pragma mark -- UICollectionViewDelegate & UICollectionDataSource
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


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"collectionView点击了 %zd",indexPath.row);
}


-(void)layoutSubviews{
    [super layoutSubviews];
}

@end
