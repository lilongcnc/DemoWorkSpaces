//
//  UIImageToDataTransformer.m
//  CoreData2
//
//  Created by 李龙 on 16/1/3.
//  Copyright © 2016年 李龙. All rights reserved.
//

#import "UIImageToDataTransformer.h"
#import <UIKit/UIKit.h>

@implementation UIImageToDataTransformer

+(BOOL)allowsReverseTransformation {
    return YES;
}

+ (Class)transformedValueClass {
    return [NSData class];
}

- (id)transformedValue:(id)value {
    return UIImagePNGRepresentation(value);
}

- (id)reverseTransformedValue:(id)value {
    return [[UIImage alloc] initWithData:value];
}


@end
