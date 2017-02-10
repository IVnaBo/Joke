//
//  Lyric.h
//  Joke
//
//  Created by BOBO on 17/2/9.
//  Copyright © 2017年 BOBO. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 歌词
 */
@interface Lyric : NSObject

/** 歌词开始时间 */
@property (nonatomic,assign) NSTimeInterval time;

/** 歌词内容 */
@property (nonatomic,copy) NSString *content;
@end
