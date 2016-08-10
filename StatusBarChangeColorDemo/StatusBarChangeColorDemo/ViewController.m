//
//  ViewController.m
//  StatusBarChangeColorDemo
//
//  Created by 李龙 on 16/4/18.
//  Copyright © 2016年 李龙. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    BOOL _isBlack;
}
@end

@implementation ViewController
- (void)viewWillAppear:(BOOL)animated
{
    _isBlack = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    _isBlack = YES;
    self.view.backgroundColor = [UIColor blackColor];
    [self setNeedsStatusBarAppearanceUpdate];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return _isBlack == NO?UIStatusBarStyleDefault:UIStatusBarStyleLightContent;
}


@end
