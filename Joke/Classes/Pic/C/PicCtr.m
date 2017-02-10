//
//  PicCtr.m
//  Joke
//
//  Created by BOBO on 17/2/4.
//  Copyright © 2017年 BOBO. All rights reserved.
//

#import "PicCtr.h"
#import "JokePicCell.h"
#import "JokePic_M.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <SDAutoLayout/SDAutoLayout.h>
#import <MJRefresh/MJRefresh.h>
static NSString * identify = @"picId";

@interface PicCtr ()<UITableViewDelegate,UITableViewDataSource>
{///
    int Page;
}
///
@property(strong,nonatomic)UITableView * picTabv;
///
@property(strong,nonatomic)NSMutableArray * marr;

@end

@implementation PicCtr

- (void)viewDidLoad {
    [super viewDidLoad];
   
    //网络请求
    [self PicHttpReq];
    //
    self.picTabv.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        Page ++;
        [self.picTabv.mj_footer beginRefreshing];
        [self PicHttpReq];
        [self.picTabv.mj_footer endRefreshing];
    }];
    [self.view addSubview:self.picTabv];
    
    // Do any additional setup after loading the view.
}

/**
 网络请求
 */
-(void)PicHttpReq
{
    [NetWorking get:newestPicURL parm:@{@"page":@(Page)} sucess:^(id responseObject) {
        NSDictionary * responseDic = (NSDictionary *)responseObject;
        int error_code = [responseDic[@"error_code"]intValue];
        if (error_code == 0) {
            NSDictionary * resultDic = responseDic[@"result"];
            NSArray * arr = resultDic[@"data"];
            for (NSDictionary * tempDic in arr) {
                JokePic_M * jk_m = [[JokePic_M alloc]initWithDic:tempDic];
                [self.marr addObject:jk_m];
            }
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.picTabv reloadData];
        });

    } failure:^(NSError *error) {
        
    }];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40+258.75;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  self.marr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JokePicCell * cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[JokePicCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    JokePic_M * jokePic_m = self.marr [indexPath.row];
    if (jokePic_m.urlstr != nil) {
        [cell.PicImg sd_setImageWithURL:[NSURL URLWithString:jokePic_m.urlstr] placeholderImage:[UIImage imageNamed:@"Unknown"]];
  
       

    }
    cell.Context.text = [NSString stringWithFormat:@"%@",jokePic_m.content];
    return cell;
}

#pragma mark - get
-(NSMutableArray *)marr
{
    if (!_marr) {
        _marr = [NSMutableArray array];
    }
    return _marr;
}
-(UITableView *)picTabv
{
    if (!_picTabv) {
        _picTabv = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, Iphone_W, Iphone_H-64-48) style:UITableViewStylePlain];
        _picTabv.dataSource = self;
        _picTabv.delegate = self;
    }
    return _picTabv;
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
