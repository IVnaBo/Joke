//
//  JokePic_M.h
//  Joke
//
//  Created by BOBO on 17/2/7.
//  Copyright © 2017年 BOBO. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JokePic_M : NSObject

/**
 笑话内容
 */
@property(copy,nonatomic)NSString * content;

/**
 网址。
 */
@property(copy,nonatomic)NSString * urlstr ;

-(instancetype)initWithDic:(NSDictionary *)dic;

@end
