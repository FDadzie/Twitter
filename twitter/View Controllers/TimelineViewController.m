//
//  TimelineViewController.m
//  twitter
//
//  Created by emersonmalca on 5/28/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "TimelineViewController.h"
#import "APIManager.h"
#import "TweetCell.h"
#import "UIImageView+AFNetworking.h"
#import "TweetModel.h"
#import "ComposeViewController.h"

@interface TimelineViewController () <UITableViewDelegate, UITableViewDataSource>
@end
@interface TimelineViewController () <ComposeViewControllerDelegate, UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) NSArray *tweets;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) UIRefreshControl *refreshControl;

@end

@implementation TimelineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self fetchTweets];
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(fetchTweets) forControlEvents:UIControlEventValueChanged];
    [self.tableView insertSubview:self.refreshControl atIndex :0];

}
- (void)fetchTweets {
    // Get timeline
    [[APIManager shared] getHomeTimelineWithCompletion:^(NSArray *tweets, NSError *error) {
        if (tweets) {
            NSLog(@"😎😎😎 Successfully loaded home timeline");
            
            for (TweetModel *tweet in tweets) {
                NSString *text = tweet.text;
                NSLog(@"%@", text);
                
            }
        } else {
            NSLog(@"😫😫😫 Error getting home timeline: %@", error.localizedDescription);
        }
        self.tweets = tweets;
        [self.tableView reloadData];
    }];
    
    [self.refreshControl endRefreshing];
    
}


   

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tweets.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TweetCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TweetCell"];
    
    TweetModel *tweet = self.tweets[indexPath.row];
    cell.tweetText.text = tweet.text;
    NSString *favoriteStr = [NSString stringWithFormat:@"%i", tweet.favoriteCount];
    cell.likeCount.text = favoriteStr;
    cell.profileId.text = tweet.user.name;
    cell.secondaryId.text = tweet.user.screenName;
    NSString *retweetStr = [NSString stringWithFormat:@"%i", tweet.retweetCount];
    cell.retweetCount.text = retweetStr;
    cell.createdAt.text = tweet.createdAtString;
    
    return cell;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UINavigationController *navigationController = [segue destinationViewController];
    ComposeViewController *composeController = (ComposeViewController*)navigationController.topViewController;
    composeController.delegate = self;
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


- (void)didTweet:(nonnull TweetModel *)tweet {
    [self.tableView reloadData];
}

@end
