//
//  imgvScale.m
//  头像点击放大
//
//  Created by ibokan on 16/7/8.
//  Copyright © 2016年 ivna. All rights reserved.
//

#import "imgvScale.h"

@implementation imgvScale


static CGRect oldframe;

+(void)showImage:(UIImageView *)avatarImageView{
    UIImage *image=avatarImageView.image;
    UIWindow *window=[UIApplication sharedApplication].keyWindow;
    UIView *backgroundView=[[UIView alloc]initWithFrame:CGRectMake(0, 0,Iphone_W, Iphone_H)];
    oldframe=[avatarImageView convertRect:avatarImageView.bounds toView:window];//保存原始位置返回时要用
    backgroundView.backgroundColor=[UIColor grayColor];
    backgroundView.alpha=0.3;
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:oldframe];
   
    imageView.image=image;
    imageView.tag=99;
    [backgroundView addSubview:imageView];
    [window addSubview:backgroundView];
    
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hideImage:)];
    [backgroundView addGestureRecognizer: tap];//背景视图添加上手势,可以返回
    
    [UIView animateWithDuration:0.3 animations:^{//动画
        imageView.frame=CGRectMake(0,([UIScreen mainScreen].bounds.size.height-image.size.height*[UIScreen mainScreen].bounds.size.width/image.size.width)/2, [UIScreen mainScreen].bounds.size.width, image.size.height*[UIScreen mainScreen].bounds.size.width/image.size.width);
        backgroundView.alpha=1;
    } completion:^(BOOL finished) {
        
    }];
}
+(void)hideImage:(UITapGestureRecognizer*)tap{
    UIView *backgroundView=tap.view;
    UIImageView *imageView=(UIImageView*)[tap.view viewWithTag:99];
    [UIView animateWithDuration:0.3 animations:^{
        imageView.frame=oldframe;//返回原始位置
        backgroundView.alpha=0;
    } completion:^(BOOL finished) {
        [backgroundView removeFromSuperview];//清除出视图
    }];
}

/**
  长按手势 保存照片到本地相册..
 */
-(void)saveImageToContainer:(UILongPressGestureRecognizer *)press
{
    UIImageView * imgv = (UIImageView *)[press view];
    if (imgv.image != nil) {
        // 本地沙盒目录
        NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
        // 得到本地沙盒中名为"MyImage"的路径，"MyImage"是保存的图片名
        NSString *imageFilePath = [path stringByAppendingPathComponent:@"MyImage"];
        // 将取得的图片写入本地的沙盒中，其中0.5表示压缩比例，1表示不压缩，数值越小压缩比例越大
        
        BOOL success = [UIImageJPEGRepresentation(imgv.image, 0.5) writeToFile:imageFilePath  atomically:YES];
        if (success){
            NSLog(@"写入本地成功");
        } 
    }
   
}
@end






