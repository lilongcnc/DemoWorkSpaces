//
//  Student+CoreDataProperties.m
//  fmdb
//
//  Created by 李龙 on 16/1/6.
//  Copyright © 2016年 李龙. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Student+CoreDataProperties.h"

@implementation Student (CoreDataProperties)

@dynamic id;
@dynamic name;
@dynamic penDict;
@dynamic book;


- (void) encodeWithCoder: (NSCoder *)coder
{
    [coder encodeObject:self.id forKey:@"id"];
    [coder encodeObject:self.name forKey:@"name"];
    [coder encodeObject:self.penDict forKey:@"penDict"];
    [coder encodeObject:self.book forKey:@"book"];
}


- (id)initWithCoder:(NSCoder *)aDecoder{
    
    if (self = [super init]) {
        
        self.id = [aDecoder decodeObjectForKey:@"id"];
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.penDict = [aDecoder decodeObjectForKey:@"booksArray"];
        self.book = [aDecoder decodeObjectForKey:@"book"];
        
    }
    
    return self;
}

@end
