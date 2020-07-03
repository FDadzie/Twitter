//
//  TweetCell.m
//  twitter
//
//  Created by fdadzie20 on 7/1/20.
//  Copyright © 2020 Emerson Malca. All rights reserved.
//

#import "TweetCell.h"


@implementation TweetCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)didTapFavorite:(id)sender {
    // TODO: Update the local tweet model
    // TODO: Update cell UI
    // TODO: Send a POST request to the POST favorites/create endpoint
}



@end
