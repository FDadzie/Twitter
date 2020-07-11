//
//  TweetDetailViewController.m
//  twitter
//
//  Created by fdadzie20 on 7/3/20.
//  Copyright © 2020 Emerson Malca. All rights reserved.
//

#import "TweetDetailViewController.h"
#import "UIImageView+AFNetworking.h"



@interface TweetDetailViewController () 
@property (weak, nonatomic) IBOutlet UIImageView *profileImg;
@property (weak, nonatomic) IBOutlet UILabel *profileLabel;
@property (weak, nonatomic) IBOutlet UILabel *handleLabel;
@property (weak, nonatomic) IBOutlet UILabel *createdLabel;
@property (weak, nonatomic) IBOutlet UILabel *tweetLabel;
@property (weak, nonatomic) IBOutlet UILabel *retweetLabel;
@property (weak, nonatomic) IBOutlet UILabel *favoriteLabel;
@property (weak, nonatomic) IBOutlet UIButton *retweetImg;
@property (weak, nonatomic) IBOutlet UIButton *favoriteImg;

@end

@implementation TweetDetailViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *profileURLString = self.tweet.user.profileImageUrl;
       NSString *clearProfileURLString = [profileURLString stringByReplacingOccurrencesOfString:@"_normal" withString:@""];
       
       NSURL *profileURL = [NSURL URLWithString:clearProfileURLString];
    self.profileImg.image = nil;
       [self.profileImg setImageWithURL:profileURL];
     
    self.tweetLabel.text = self.tweet.text;
    NSString *favoriteStr = [NSString stringWithFormat:@"%d", self.tweet.favoriteCount];
    self.favoriteLabel.text = favoriteStr;
    self.profileLabel.text = self.tweet.user.name;
    self.handleLabel.text = self.tweet.user.screenName;
    NSString *retweetStr = [NSString stringWithFormat:@"%d", self.tweet.retweetCount];
    self.retweetLabel.text = retweetStr;
    self.createdLabel.text = self.tweet.createdAtString;

    [self.profileLabel sizeToFit];
    [self.tweetLabel sizeToFit];
    [self.handleLabel sizeToFit];

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
