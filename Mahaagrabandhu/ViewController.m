//
//  ViewController.m
//  Mahaagrabandhu
//
//  Created by Dipen Sekhsaria on 27/09/16.
//  Copyright © 2016 Stardeep. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setupUIWebView];
    
}

- (void) setupUIWebView {
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.contentWebView.delegate = self;
    [self loadUIWebView];
    
}


#pragma mark - Load Webview URL

- (void) loadUIWebView {
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    NSURL *url = [NSURL URLWithString:@"http://www.mahaagrabandhu.com"];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [self.contentWebView loadRequest:urlRequest];
    
}


#pragma mark - UIWebview Delegates

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}


- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
}


- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    
    if ([error code] == NSURLErrorCancelled) {
        return;
    }
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:[error localizedDescription] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    [alert show];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)forwardButtonTapped:(id)sender {
    
    if ([self.contentWebView canGoForward]) {
        [self.contentWebView goForward];
    }
    
}

- (IBAction)backButtonTapped:(id)sender {
    
    if ([self.contentWebView canGoBack]) {
        [self.contentWebView goBack];
    }
    
}

- (IBAction)stopButtonTapped:(id)sender {
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    [self.contentWebView stopLoading];
    
}

- (IBAction)reloadButtonTapped:(id)sender {
    
    [self.contentWebView reload];
    
}
@end
