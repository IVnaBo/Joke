//
//  BaseTabBarCtr.m
//  Joke
//
//  Created by BOBO on 17/2/4.
//  Copyright © 2017年 BOBO. All rights reserved.
//

#import "BaseTabBarCtr.h"
#import "BaseNavc.h"
#import "HomeCtr.h"
#import "PersonCtr.h"
#import "PicCtr.h"

#import "MusicVC.h"
@interface BaseTabBarCtr ()

@end

@implementation BaseTabBarCtr
+(void)initialize
{//统一设置所有tabBarItem的属性 选项按钮
    
        UITabBarItem *tabBarItem = [UITabBarItem appearance];
        //设置未选中时 标题的字号 ，颜色
        NSMutableDictionary *nordic = @{}.mutableCopy;//创建可变字典
        nordic[NSFontAttributeName] = [UIFont systemFontOfSize:11.0];//修改字体字号
        nordic[NSForegroundColorAttributeName] = [UIColor colorWithRed:31/255.0 green:31/255.0 blue:31/255.0 alpha:1];//设置文字颜色
        [tabBarItem setTitleTextAttributes:nordic forState:UIControlStateNormal];
        //设置选中时 标题的字号，颜色  设计图片大小范围为33 -37 镂空图 正方形
        NSMutableDictionary *seldic = @{}.mutableCopy;//创建可变字典
        seldic[NSFontAttributeName]=[UIFont systemFontOfSize:11.0];//修改字体字号
        seldic[NSForegroundColorAttributeName] = [UIColor colorWithRed:61/255.0 green:122/255.0 blue:197/255.0 alpha:1];//设置文字颜色
        [tabBarItem setTitleTextAttributes:seldic forState:UIControlStateSelected];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    HomeCtr    * HomeVC   = [HomeCtr new];
    PersonCtr  * personVC = [PersonCtr new];
    PicCtr     * picVC    = [PicCtr new];
    MusicVC    * wordVC   = [MusicVC new];
    [self setting:HomeVC andNormalDayImage:@"home" andSelectedDayImage
                 :@"home_press" andTitle:@"首页"];
    [self setting:wordVC andNormalDayImage:@"audit" andSelectedDayImage:
     @"audit_press" andTitle:@"笑话"];
    [self setting:picVC andNormalDayImage:@"Found" andSelectedDayImage
                 :@"Found_press" andTitle:@"趣图图"];
    [self setting:personVC andNormalDayImage:@"newstab" andSelectedDayImage
                 :@"newstab_press" andTitle:@"我的"];
    
    // Do any additional setup after loading the view.
}
//设置子视图控制器带导航
-(void)setting:(UIViewController *)child andNormalDayImage:(NSString *)normalDayImage  andSelectedDayImage:(NSString *)selectedDayImage andTitle:(NSString *)title
{
    BaseNavc *nav = [[BaseNavc alloc]initWithRootViewController:child];
 
    [nav.navigationBar setBarTintColor:[UIColor colorWithRed:(241)/255.0 green:(241)/255.0 blue:(241)/255.0 alpha:1]];
    [child.tabBarItem setImage:[UIImage imageNamed:normalDayImage]];
    [child.tabBarItem setSelectedImage:[UIImage imageNamed:selectedDayImage]];
    child.tabBarItem.title = title;
    child.tabBarItem.imageInsets = UIEdgeInsetsMake(2, 0, -1, 0);
    [self addChildViewController:nav];
    
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
