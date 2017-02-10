//
//  BaseViewController.h
//  Joke
//
//  Created by BOBO on 17/2/4.
//  Copyright © 2017年 BOBO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

- (void)pop;

- (void)popToRootVc;

- (void)popToVc:(UIViewController *)vc;

- (void)Ctrdismiss;

- (void)presentVc:(UIViewController *)vc;

- (void)pushVc:(UIViewController *)vc;
@end
