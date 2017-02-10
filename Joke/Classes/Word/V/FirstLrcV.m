//
//  FirstLrcV.m
//  Joke
//
//  Created by BOBO on 17/2/9.
//  Copyright © 2017年 BOBO. All rights reserved.
//

#import "FirstLrcV.h"

@implementation FirstLrcV


-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {

        self.singerLab = [[UILabel alloc]initWithFrame:CGRectMake(self.centerX-50, 75, 100, 35)];
//        self.singerLab.textColor = [UIColor whiteColor];
        self.singerLab.text = @"林俊杰";
        
        self.singerIconV = [[UIImageView alloc]initWithFrame:CGRectMake(self.centerX-75, self.centerY-75, 150, 150)];
        self.singerIconV.layer.cornerRadius = 150/2.0;
        self.singerIconV.image = [UIImage imageNamed:@"徐歌阳.jpg"];
        self.singerIconV.layer.masksToBounds = YES;
        self.lyriclab = [[UILabel alloc]initWithFrame:CGRectMake(15, self.singerIconV.y+self.singerIconV.height+35, self.width-30, 35)];
        self.lyriclab.text = @"每一滴眼泪，都不能改变";
        self.lyriclab.textAlignment = NSTextAlignmentCenter;
        self.lyriclab.numberOfLines = 2;
//        [self.lyriclab sizeToFit];
        
        self.albumlab = [[UILabel alloc]initWithFrame:CGRectMake(15, self.lyriclab.y+self.lyriclab.height+15, 120, 25)];
        self.albumlab.font = [UIFont systemFontOfSize:14.0];
        self.albumlab.text = @"好声音";
        [self addSubview:self.singerIconV];
        [self addSubview:self.singerLab];
        [self addSubview:self.lyriclab];
        [self addSubview:self.albumlab];
    }
    return self;
}

@end
