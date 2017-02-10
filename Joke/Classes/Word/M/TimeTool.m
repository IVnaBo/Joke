//
//  TimeTool.m
//  Joke
//
//  Created by BOBO on 17/2/9.
//  Copyright © 2017年 BOBO. All rights reserved.
//

#import "TimeTool.h"

@implementation TimeTool
+ (NSString *)stringWithTime:(NSTimeInterval)time {
    
    int minute = time / 60;
    int second = (int)time % 60;
    return [NSString stringWithFormat:@"%02d:%02d",minute,second];
}
@end
