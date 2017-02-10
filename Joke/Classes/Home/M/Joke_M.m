//
//  Joke_M.m
//  Joke
//
//  Created by BOBO on 17/2/6.
//  Copyright © 2017年 BOBO. All rights reserved.
//

#import "Joke_M.h"

@implementation Joke_M

-(instancetype)initWithDic:(NSDictionary *)dic
{
    self.content = [NSString stringWithFormat:@"%@",dic[@"content"]];
    self.updateT = [NSString stringWithFormat:@"%@",dic[@"updatetime"]];
    return self;
}
@end
