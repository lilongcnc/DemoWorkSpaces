//
//  ViewController.m
//  LxDBAnythingDemo
//
//  Created by 李龙 on 16/3/29.
//  Copyright © 2016年 lauren. All rights reserved.
//

#import "ViewController.h"
#import "LxDBAnything.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGPoint point = CGPointMake(100, 100);
    LxDBAnyVar(point);
    
    Person *person = [[Person alloc] init];
    person.name = @"张三";
    person.age = @"10";
    person.address = @"北京市海淀区上地七街";
    
    //直接打印模型文件
//    LxDBAnyVar(person);
//    LxDBObjectAsXml(person);
    LxDBObjectAsJson(person);
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    LxDBViewHierarchy(view);
    
    
}


@end
