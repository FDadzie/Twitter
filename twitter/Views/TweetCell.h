//
//  TweetCell.h
//  twitter
//
//  Created by fdadzie20 on 7/1/20.
//  Copyright © 2020 Emerson Malca. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TweetCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *createdAt;
@property (weak, nonatomic) IBOutlet UIImageView *profileImage;
@property (weak, nonatomic) IBOutlet UILabel *profileId;
@property (weak, nonatomic) IBOutlet UILabel *secondaryId;
@property (weak, nonatomic) IBOutlet UILabel *tweetText;
@property (weak, nonatomic) IBOutlet UILabel *retweetCount;
@property (weak, nonatomic) IBOutlet UILabel *likeCount;
@property (nonatomic, strong) NSMutableArray *tweet;
@property (weak, nonatomic) IBOutlet UIButton *favoriteIcon;
@property (weak, nonatomic) IBOutlet UIButton *retweetIcon;
@property (weak, nonatomic) IBOutlet UIButton *messageIcon;





@end

NS_ASSUME_NONNULL_END
