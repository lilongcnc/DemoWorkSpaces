//
//  Book+CoreDataProperties.m
//  fmdb
//
//  Created by 李龙 on 16/1/4.
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

//http://stackoverflow.com/questions/17350191/coredata-error-failed-to-call-designated-initializer-on-nsmanagedobject-class

- (void) encodeWithCoder: (NSCoder *)coder
{
    [coder encodeObject:self.bookID forKey:@"bookID"];
    [coder encodeObject:self.bookName forKey:@"bookName"];
    [coder encodeObject:self.student forKey:@"student"];
}


- (id)initWithCoder:(NSCoder *)aDecoder{
    
//    - (id)initWithCoder:(NSCoder *)decoder {
//    NSManagedObjectContext *moc = [RKManagedObjectStore defaultStore].mainQueueManagedObjectContext;
//    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Book" inManagedObjectContext:context];
//    if((self = [super initWithEntity:entity insertIntoManagedObjectContext:context])) {
    
    if (self = [super init]) {
        
        self.bookID = [aDecoder decodeObjectForKey:@"bookID"];
        
        self.bookName = [aDecoder decodeObjectForKey:@"bookName"];
    }
    
    return self;
}

@end

