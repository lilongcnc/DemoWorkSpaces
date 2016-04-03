//
//  Book+CoreDataProperties.m
//  fmdb
//
//  Created by 李龙 on 16/1/6.
//  Copyright © 2016年 李龙. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Book+CoreDataProperties.h"

@implementation Book (CoreDataProperties)

@dynamic bookID;
@dynamic bookName;
@dynamic student;

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
        self.student = [aDecoder decodeObjectForKey:@"student"];
    }
    
    return self;
}


@end
