//
//  Joke_M.h
//  Joke
//
//  Created by BOBO on 17/2/6.
//  Copyright © 2017年 BOBO. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Joke_M : NSObject

/**
 笑话内容
 */
@property(copy,nonatomic)NSString * content;

/**
 更新时间。。
 */
@property(copy,nonatomic)NSString * updateT;

-(instancetype)initWithDic:(NSDictionary *)dic;
@end
