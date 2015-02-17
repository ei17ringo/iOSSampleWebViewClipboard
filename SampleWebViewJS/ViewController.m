//
//  ViewController.m
//  SampleWebViewJS
//
//  Created by Eriko Ichinohe on 2015/02/16.
//  Copyright (c) 2015年 Eriko Ichinohe. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSURL *myURL = [NSURL URLWithString:@"http://ja.wikipedia.org/wiki/%E5%85%B5%E5%BA%AB%E7%9C%8C"];
    
    NSURLRequest *myURLReq = [NSURLRequest requestWithURL:myURL];
    
    [self.myWebView loadRequest:myURLReq];
    
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(pasteboardChanged:)
                                                 name:UIPasteboardChangedNotification
                                               object:nil];

}

-(BOOL)pasteboardChanged:(id)sender{
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];

    
    // 文字列を取り出す。(消去と書き込みで2回呼ばれる)
    NSString *string = [pasteboard valueForPasteboardType:@"public.text"];
    NSLog(@"クリップボード:%@",string);

    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
