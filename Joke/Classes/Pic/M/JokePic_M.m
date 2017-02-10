//
//  JokePic_M.m
//  Joke
//
//  Created by BOBO on 17/2/7.
//  Copyright © 2017年 BOBO. All rights reserved.
//

#import "JokePic_M.h"

@implementation JokePic_M

-(instancetype)initWithDic:(NSDictionary *)dic
{
    self.content = [NSString stringWithFormat:@"%@",dic[@"content"]];
    self.urlstr  = [NSString stringWithFormat:@"%@",dic[@"url"]];
    return self;
}
@end
