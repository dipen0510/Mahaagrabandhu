//
//  ViewController.h
//  Mahaagrabandhu
//
//  Created by Dipen Sekhsaria on 27/09/16.
//  Copyright © 2016 Stardeep. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIWebViewDelegate> {
}

@property (weak, nonatomic) IBOutlet UIWebView *contentWebView;

- (IBAction)forwardButtonTapped:(id)sender;
- (IBAction)backButtonTapped:(id)sender;
- (IBAction)stopButtonTapped:(id)sender;
- (IBAction)reloadButtonTapped:(id)sender;

@end

