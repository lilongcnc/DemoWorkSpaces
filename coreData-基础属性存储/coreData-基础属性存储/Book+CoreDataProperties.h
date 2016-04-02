//
//  Book+CoreDataProperties.h
//  fmdb
//
//  Created by 李龙 on 15/12/28.
//  Copyright © 2015年 李龙. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Book.h"

NS_ASSUME_NONNULL_BEGIN

@interface Book (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *bookID;
@property (nullable, nonatomic, retain) NSString *bookName;
@property (nullable, nonatomic, retain) Student *student;

@end

NS_ASSUME_NONNULL_END
