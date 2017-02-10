//
//  NSDateFormatter+Share.m
//  Joke
//
//  Created by BOBO on 17/2/9.
//  Copyright © 2017年 BOBO. All rights reserved.
//

#import "NSDateFormatter+Share.h"

@implementation NSDateFormatter (Share)

+ (instancetype)sharedDateFormatter {
    static NSDateFormatter *_dateFormatter;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _dateFormatter = [[self alloc]  init];
    });
    return _dateFormatter;
}

@end
