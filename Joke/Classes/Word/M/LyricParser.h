//
//  LyricParser.h
//  Joke
//
//  Created by BOBO on 17/2/9.
//  Copyright © 2017年 BOBO. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LyricParser : NSObject
+ (NSArray *)parserLyricWithFileName:(NSString *)fileName;
@end
