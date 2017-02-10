//
//  JokePicCell.m
//  Joke
//
//  Created by BOBO on 17/2/7.
//  Copyright © 2017年 BOBO. All rights reserved.
//

#import "JokePicCell.h"
#import <SDAutoLayout/SDAutoLayout.h>
#import "imgvScale.h"
@implementation JokePicCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.Context = [[UILabel alloc]initWithFrame:CGRectMake(15, 5, Iphone_W-30, 35)];
        self.Context.font = [UIFont systemFontOfSize:14.0];
//        CGFloat Img_W = 345.00;
        CGFloat img_H = 258.75;
        self.PicImg = [[UIImageView alloc]initWithFrame:CGRectMake(15, 40, Iphone_W-30, img_H)];
        self.PicImg.userInteractionEnabled = YES;
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imgvTapAction:)];
        
        [self.PicImg addGestureRecognizer:tap];
       
        
        [self.contentView addSubview:self.Context];
        [self.contentView addSubview:self.PicImg];
    }
    return  self;
}
//查看大图
-(void)imgvTapAction:(UITapGestureRecognizer *)tap
{
    UIImageView * imgv = (UIImageView *)[tap view];
    if (imgv.image != nil) {
        [imgvScale showImage:imgv];
    }
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
