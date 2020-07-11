//
//  TweetDetailViewController.h
//  twitter
//
//  Created by fdadzie20 on 7/3/20.
//  Copyright © 2020 Emerson Malca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TweetModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface TweetDetailViewController : UIViewController

@property (nonatomic, strong) TweetModel *tweet;
@end

NS_ASSUME_NONNULL_END
