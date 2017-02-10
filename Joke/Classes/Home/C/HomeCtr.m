//
//  HomeCtr.m
//  Joke
//
//  Created by BOBO on 17/2/4.
//  Copyright © 2017年 BOBO. All rights reserved.
//

#import "HomeCtr.h"
#import "NetWorking.h"
#import "JokeTextCell.h"
#import "Joke_M.h"
#import <MJRefresh/MJRefresh.h>
static NSString * identify = @"jkID";
@interface HomeCtr ()<UITableViewDelegate,UITableViewDataSource>
{
    int page;
}
/// 数据源
@property(strong,nonatomic)NSMutableArray * Marr;

@property(strong,nonatomic)UITableView * jkTabv;
@end

@implementation HomeCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"最新笑话";
    page = 1;
    [self jokeHttp_Req];
    
    
    [self.jkTabv registerNib:[UINib nibWithNibName:@"JokeTextCell" bundle:nil] forCellReuseIdentifier:identify];
    
    [self.view addSubview:self.jkTabv];
  
    
    self.jkTabv.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        page ++;
        [self.jkTabv.mj_footer beginRefreshing];
        [self jokeHttp_Req];
        [self.jkTabv.mj_footer endRefreshing];
    }];
    
    // Do any additional setup after loading the view.
}

-(void)jokeHttp_Req
{
    NSDate *datenow = [NSDate date];//现在时间,你可以输出来看下是什么格式
    
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970]];
    
    [NetWorking get:newestJKURL parm:@{@"page":@(page)} sucess:^(id responseObject) {
        NSDictionary * responseDic = (NSDictionary *)responseObject;
        int error_code = [responseDic[@"error_code"]intValue];
        if (error_code == 0) {
            NSDictionary * resultDic = responseDic[@"result"];
            NSArray * arr = resultDic[@"data"];
            for (NSDictionary * tempDic in arr) {
                Joke_M * jk_m = [[Joke_M alloc]initWithDic:tempDic];
                [self.Marr addObject:jk_m];
            }
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.jkTabv reloadData];
        });
    } failure:^(NSError *error) {
        NSLog(@"失败返回%@",error);
    }];
}
-(NSString *)setDateWith:(long)Timesp
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyyMMddHH"];//H24 h 12
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:Timesp];//1296035591为时间戳。
    
    NSString *confromTimespStr = [dateFormatter stringFromDate:confromTimesp];
    
    return confromTimespStr;
    
    
}
//根据label宽度获取文本高度
-(CGFloat)hightWithStr:(NSString *)str
           andtextFont:(CGFloat)font
          andtextWidth:(CGFloat)width{
    //获取文本高度
    CGFloat hight=[str boundingRectWithSize:CGSizeMake(width, 10000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:(font)]} context:nil].size.height;
    //向上取整并输出
    return ceilf(hight)+20+17;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Joke_M * jk_M = self.Marr[indexPath.row];
    CGFloat tb_H =  [ self hightWithStr:jk_M.content andtextFont:14.0 andtextWidth:self.view.frame.size.width-20];
    return tb_H;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  self.Marr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JokeTextCell * cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[JokeTextCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    Joke_M * jk_M = self.Marr[indexPath.row];
    cell.Contentlab.text = jk_M.content;
    cell.UpdateT.text    = jk_M.updateT;
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(UITableView *)jkTabv
{
    if (!_jkTabv) {
        _jkTabv = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64) style:UITableViewStylePlain];
        _jkTabv.delegate   = self;
        _jkTabv.dataSource = self;
    }
    return _jkTabv;
}
-(NSMutableArray *)Marr
{
    if (!_Marr) {
        _Marr = [NSMutableArray arrayWithCapacity:15];
    }
    return _Marr;
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
