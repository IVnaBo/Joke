//
//  MusicVC.m
//  Joke
//
//  Created by BOBO on 17/2/8.
//  Copyright © 2017年 BOBO. All rights reserved.
//

#import "MusicVC.h"
#import "WPFPlayManager.h"
#import "Music_M.h"
#import <MJExtension/MJExtension.h>
#import "FirstLrcV.h"
#import "TimeTool.h"
#import "Lyric.h"
/** 毛玻璃效果  */
#import "UIImageView+LBBlurredImage.h"
@interface MusicVC ()
{
    //歌手信息视图
    FirstLrcV * singerInfoV;

}

@property (weak, nonatomic) IBOutlet UILabel *endTlab;
@property (weak, nonatomic) IBOutlet UILabel *currentlab;
@property (weak, nonatomic) IBOutlet UISlider *musicSlider;
@property (weak, nonatomic) IBOutlet UIButton *nextBtn;
@property (weak, nonatomic) IBOutlet UIButton *playorPauseBtn;
@property (weak, nonatomic) IBOutlet UIButton *previousBtn;
//高斯模糊背景
@property (weak, nonatomic) IBOutlet UIImageView *BG;
//内容滚动视图
@property (weak, nonatomic) IBOutlet UIScrollView *contentScrov;
//歌曲索引
@property (assign,nonatomic)NSInteger currentMusicIndex;
//歌词索引
@property (assign,nonatomic)NSInteger currentLyricIndex;
//歌词数组
@property (strong,nonatomic)NSMutableArray * lyricArr;
//播放列表
@property (strong,nonatomic)NSArray  * musicArr;
//定时器 刷新进度条,更新歌词.
@property (strong,nonatomic)NSTimer  * timer;
@end

@implementation MusicVC

-(NSArray *)musicArr
{
    if (!_musicArr) {
        _musicArr = [Music_M mj_objectArrayWithFilename:@"mlist.plist"];
    }
    return _musicArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化索引
    self.currentLyricIndex = 0;
    self.currentMusicIndex = 0;
    
    [self setupUI];
    
    // Do any additional setup after loading the view from its nib.
}

#pragma mark - UI

- (void)setupUI
{
    [self.BG setImageToBlur:[UIImage imageNamed:@"徐歌阳.jpg"] blurRadius:5 completionBlock:nil];
    //内容视图的大小
    self.contentScrov.contentSize = CGSizeMake(Iphone_W*2, self.contentScrov.height);
    //第一屏内容.
    FirstLrcV * firstlirc = [[FirstLrcV alloc]initWithFrame:CGRectMake(0, 0, self.contentScrov.width, self.contentScrov.height)];
    [self.contentScrov addSubview:firstlirc];
    singerInfoV = firstlirc;
    
    //第二屏内容.
    
    
}

#pragma mark - action

/**
 切歌
 */
- (void)changeMusic{
    
}
/**开始更新进度条 开启定时器*/
-(void)startUpdateProgress
{
     self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(updateProgress) userInfo:nil repeats:YES];
}
/**停止更新进度条 关闭定时器*/
-(void)stopupdateProgress
{
    [self.timer invalidate];
    self.timer = nil;
}
/**更新进度条*/
-(void)updateProgress
{
    WPFPlayManager * musicPlayer = [WPFPlayManager sharedPlayManager];
    //当前时间
    self.currentlab.text = [NSString stringWithFormat:@"%@",[TimeTool stringWithTime:musicPlayer.currentTime]];
    //进度条.
    self.musicSlider.value = musicPlayer.currentTime/musicPlayer.duration;
    //歌手头像旋转 相对于自身.
    singerInfoV.singerIconV.transform = CGAffineTransformRotate(singerInfoV.singerIconV.transform, M_PI_2* 0.01);
    
    
}
- (IBAction)playorPause:(UIButton *)sender {
    sender.selected = !sender.selected;
   
     WPFPlayManager * musicPlayer = [WPFPlayManager sharedPlayManager];
    if (sender.selected) {
        
        Music_M * music = self.musicArr[_currentMusicIndex];
        [musicPlayer playMusicWithFileName:music.mp3 didComplete:^{//播放完毕后
            //下一首
        }];
        self.endTlab.text = [NSString stringWithFormat:@"%@",[TimeTool stringWithTime:musicPlayer.duration]];
         [self startUpdateProgress];
    }else{
        [musicPlayer pause];
        [self stopupdateProgress];
    }
}

/**
 上一曲

 @param sender <#sender description#>
 */
- (IBAction)previous:(UIButton *)sender {
}

/**
 下一曲

 @param sender <#sender description#>
 */
- (IBAction)next:(UIButton *)sender {
    
}
- (IBAction)SliderChangeValue:(UISlider *)sender {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
