//
//  NetWorking.h
//  Joke
//
//  Created by BOBO on 17/2/6.
//  Copyright © 2017年 BOBO. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <AFNetworking/AFNetworking.h>
typedef NS_ENUM(NSUInteger, NetworkStates) {
    NetworkStatesNone,  // 没有网络
    NetworkStates2G,    // 2G
    NetworkStates3G,    // 3G
    NetworkStates4G,    // 4G
    NetworkStatesWIFI   // WIFI
};
@interface NetWorking : NSObject

/**
 get方式网络请求
 
 @param URLstr  请求路径
 @param parmmer 请求参数
 @param sucess  成功返回
 @param failure 失败返回
 */
+ (void)get:(NSString *)URLstr parm:(id)parmmer sucess:(void (^)(id responseObject))sucess failure:(void (^)(NSError *error))failure;

@end
