//
//  ComposeViewController.m
//  twitter
//
//  Created by fdadzie20 on 7/2/20.
//  Copyright © 2020 Emerson Malca. All rights reserved.
//

#import "ComposeViewController.h"
#import "APIManager.h"

@interface ComposeViewController ()

@end

@implementation ComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)onCloseTap:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}

- (IBAction)onTweetTap:(id)sender {
    [[APIManager shared] postStatusWithText:_tweetText.text completion:^(TweetModel *model, NSError *error) {
        if (model) {
            [self.delegate didTweet:model];
            NSLog(@"😎 Successfully posted tweet");
        } else {
        NSLog(@"😫 Error posting tweet", error.localizedDescription);
        }
    }];
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
