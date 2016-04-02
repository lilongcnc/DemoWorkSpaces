//
//  BookInfo.m
//  fmdb
//
//  Created by 李龙 on 16/1/5.
//  Copyright © 2016年 李龙. All rights reserved.
//

#import "BookInfo.h"

@implementation BookInfo

- (void) encodeWithCoder: (NSCoder *)coder
{
    [coder encodeObject:self.bookID forKey:@"bookID"];
    [coder encodeObject:self.bookName forKey:@"bookName"];
    [coder encodeObject:self.student forKey:@"student"];
}


- (id)initWithCoder:(NSCoder *)aDecoder{
    
    if (self = [super init]) {
        
        self.bookID = [aDecoder decodeObjectForKey:@"bookID"];
        
        self.bookName = [aDecoder decodeObjectForKey:@"bookName"];
    }
    
    return self;
}

@end
