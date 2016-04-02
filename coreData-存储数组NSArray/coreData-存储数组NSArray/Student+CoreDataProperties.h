//
//  Student+CoreDataProperties.h
//  fmdb
//
//  Created by 李龙 on 16/1/4.
//  Copyright © 2016年 李龙. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Student.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Student (CoreDataProperties)<NSCoding>

@property (nullable, nonatomic, retain) UIImage *faceImage;
@property (nullable, nonatomic, retain) NSNumber *id;
@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSData *booksArray;
@property (nullable, nonatomic, retain) Book *book;

@end

NS_ASSUME_NONNULL_END
