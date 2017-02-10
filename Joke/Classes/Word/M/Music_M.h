//
//  Music_M.h
//  Joke
//
//  Created by BOBO on 17/2/9.
//  Copyright © 2017年 BOBO. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum
{
    WPFMusicTypeLocal,
    WPFMusicTypeRemote
}WPFMusicType;


@interface Music_M : NSObject

/** 图片 */
@property (nonatomic,copy) NSString *image;

/** 歌词 */
@property (nonatomic,copy) NSString *lrc;

/** 歌曲 */
@property (nonatomic,copy) NSString *mp3;

/** 歌曲名 */
@property (nonatomic,copy) NSString *name;

/** 歌手 */
@property (nonatomic,copy) NSString *singer;

/** 专辑 */
@property (nonatomic,copy) NSString *album;

/** 类型 */
@property (nonatomic,assign) WPFMusicType type;
@end
