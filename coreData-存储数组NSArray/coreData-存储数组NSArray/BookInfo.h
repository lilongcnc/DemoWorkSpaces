//
//  BookInfo.h
//  fmdb
//
//  Created by 李龙 on 16/1/5.
//  Copyright © 2016年 李龙. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"

@interface BookInfo : NSObject

@property (nonatomic, assign) NSNumber *bookID;
@property (copy, nonatomic) NSString *bookName;
@property (strong,nonatomic) Student *student;

@end
