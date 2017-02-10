//
//  Header.h
//  Joke
//
//  Created by BOBO on 17/2/6.
//  Copyright © 2017年 BOBO. All rights reserved.
//

#ifndef Header_h
#define Header_h

//按更新时间查询笑话.... time page
#define  contentURL  @"http://japi.juhe.cn/joke/content/list.from?key=579bfad444361ece60ceb8fa41008cec&pagesize=10&sort=asc"

//最新笑话....  page
#define newestJKURL @"http://japi.juhe.cn/joke/content/text.from?key=579bfad444361ece60ceb8fa41008cec&pagesize=10"

//按更新时间查看趣图.... time page
#define jkPicURL @"http://japi.juhe.cn/joke/img/list.from?key=579bfad444361ece60ceb8fa41008cec&pagesize=10&sort=asc"

//最新趣图.... page
#define newestPicURL @"http://japi.juhe.cn/joke/img/text.from?key=579bfad444361ece60ceb8fa41008cec&pagesize=10"
//随机获取.... 趣图/笑话
#define randJKURL @"http://v.juhe.cn/joke/randJoke.php?key=579bfad444361ece60ceb8fa41008cec&type=pic"


#define Iphone_W [UIScreen mainScreen].bounds.size.width
#define Iphone_H [UIScreen mainScreen].bounds.size.height





#endif /* Header_h */
