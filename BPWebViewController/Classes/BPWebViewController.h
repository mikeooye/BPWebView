//
//  BPWebViewController.h
//  BPWebViewController
//
//  Created by LiHaozhen on 15/4/19.
//  Copyright (c) 2015年 ihojin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BPWebViewController : UIViewController

@property (copy, nonatomic) NSURL *url;

+ (instancetype)webViewController;
@end
