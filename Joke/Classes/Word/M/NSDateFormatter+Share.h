//
//  NSDateFormatter+Share.h
//  Joke
//
//  Created by BOBO on 17/2/9.
//  Copyright © 2017年 BOBO. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDateFormatter (Share)
//资源消耗大的类 使用单例创建
+ (instancetype)sharedDateFormatter;
@end
