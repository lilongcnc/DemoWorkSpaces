//
//  HomeTableViewCell.h
//  HomeTableViewDemo
//
//  Created by 李龙 on 16/3/28.
//  Copyright © 2016年 李龙. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HomeTableViewCell;

@protocol HomeTableViewCellDelegate <NSObject>

- (void)homeTableViewCell:(HomeTableViewCell *)cell withScrollViewHeight:(CGFloat)scrollViewHeight;

@end

@interface HomeTableViewCell : UITableViewCell

@property (nonatomic,assign) id<HomeTableViewCellDelegate> delegate;

//@property (nonatomic,copy) void(^cellGetCellHeightBlock)(CGFloat scrollViewHeight);

@end
