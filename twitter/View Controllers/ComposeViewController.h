//
//  ComposeViewController.h
//  twitter
//
//  Created by fdadzie20 on 7/2/20.
//  Copyright © 2020 Emerson Malca. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
// forwards required by header
@class TweetModel;

@protocol ComposeViewControllerDelegate

- (void)didTweet:(TweetModel *)tweet;

@end

@interface ComposeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *tweetText;
@property (nonatomic, weak) id<ComposeViewControllerDelegate> delegate;




@end

NS_ASSUME_NONNULL_END
