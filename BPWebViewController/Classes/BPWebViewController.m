//
//  BPWebViewController.m
//  BPWebViewController
//
//  Created by LiHaozhen on 15/4/19.
//  Copyright (c) 2015年 ihojin. All rights reserved.
//

#import "BPWebViewController.h"
#import "NJKWebViewProgress.h"
#import "NJKWebViewProgressView.h"

#define kDefaultTintColor [UIColor colorWithRed:22.f / 255.f green:126.f / 255.f blue:251.f / 255.f alpha:1.0]

@interface BPWebViewController ()<NJKWebViewProgressDelegate>

@property (strong, nonatomic) IBOutlet NJKWebViewProgress *progressProxy;
@property (weak, nonatomic) IBOutlet NJKWebViewProgressView *progressView;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *backItem;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *closeItem;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *moreItem;
- (IBAction)doBack:(id)sender;
- (IBAction)doMore:(id)sender;
- (IBAction)doClose:(id)sender;
@end

@implementation BPWebViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:self.url]];
    self.navigationController.interactivePopGestureRecognizer.delegate = nil;
}

- (void)webViewProgress:(NJKWebViewProgress *)webViewProgress updateProgress:(float)progress
{
    [_progressView setProgress:progress animated:YES];
    self.title = [_webView stringByEvaluatingJavaScriptFromString:@"document.title"];
}

+ (instancetype)webViewController
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"BPWeb" bundle:nil];
    
    return [storyboard instantiateViewControllerWithIdentifier:@"BPWebViewController"];
}
- (IBAction)doBack:(id)sender {
    if ([self.webView canGoBack]) {
        [self.webView goBack];
        
        self.navigationItem.leftBarButtonItems = @[self.backItem, self.closeItem];
    }else{
        
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (IBAction)doMore:(id)sender {
}

- (IBAction)doClose:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}
@end
