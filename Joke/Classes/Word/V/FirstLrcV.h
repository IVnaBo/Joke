//
//  FirstLrcV.h
//  Joke
//
//  Created by BOBO on 17/2/9.
//  Copyright © 2017年 BOBO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstLrcV : UIView


/**
 歌手
 */
@property(strong,nonatomic)UILabel * singerLab;

/**
 歌手头像
 */
@property(strong,nonatomic)UIImageView * singerIconV;

/**
 单行歌词
 */
@property(strong,nonatomic)UILabel * lyriclab;

/**
 专辑 ，出处。
 */
@property(strong,nonatomic)UILabel * albumlab;

-(instancetype)initWithFrame:(CGRect)frame;
@end
