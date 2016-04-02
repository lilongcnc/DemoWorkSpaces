//
//  Student+CoreDataProperties.m
//  fmdb
//
//  Created by 李龙 on 16/1/4.
//  Copyright © 2016年 李龙. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Student+CoreDataProperties.h"
#import "UIImageToDataTransformer.h"

@implementation Student (CoreDataProperties)

@dynamic id;
@dynamic name;
@dynamic faceImage;
@dynamic booksArray;
@dynamic book;

+ (void)initialize {
    if (self == [Student class]) {
        UIImageToDataTransformer *transformer = [[UIImageToDataTransformer alloc] init];
        [NSValueTransformer setValueTransformer:transformer forName:@"UIImageToDataTransformer"];
    }
}


- (void) encodeWithCoder: (NSCoder *)coder
{
    [coder encodeObject:self.id forKey:@"id"];
    [coder encodeObject:self.name forKey:@"name"];
    [coder encodeObject:self.faceImage forKey:@"faceImage"];
    [coder encodeObject:self.booksArray forKey:@"booksArray"];
    [coder encodeObject:self.book forKey:@"book"];
}


- (id)initWithCoder:(NSCoder *)aDecoder{
    
    if (self = [super init]) {
        
        self.id = [aDecoder decodeObjectForKey:@"id"];
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.faceImage = [aDecoder decodeObjectForKey:@"faceImage"];
        self.booksArray = [aDecoder decodeObjectForKey:@"booksArray"];
        self.book = [aDecoder decodeObjectForKey:@"book"];
        
    }
    
    return self;
}

@end
