//
//  ViewController.m
//  BPWebViewController
//
//  Created by LiHaozhen on 15/4/19.
//  Copyright (c) 2015年 ihojin. All rights reserved.
//

#import "ViewController.h"
#import "BPWebViewController.h"

@interface ViewController ()<UITextViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)goWithURLPath:(NSURL *)path {
    
    BPWebViewController *webVC = [BPWebViewController webViewController];
    webVC.url = path;
    [self.navigationController pushViewController:webVC animated:YES];
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"]) {
        NSURL *url = [NSURL URLWithString:textView.text];
        if (url) {
            [self.view endEditing:YES];
            [self goWithURLPath:url];
        }

        return NO;
    }
    return YES;
}
@end
