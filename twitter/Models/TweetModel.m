//
//  TweetModel.m
//  twitter
//
//  Created by fdadzie20 on 6/30/20.
//  Copyright © 2020 Emerson Malca. All rights reserved.
//

#import "TweetModel.h"
#import "UserModel.h"

@implementation TweetModel

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    
    
    self = [super init];
    if (self) {
        
        // Is this a re-tweet?
        NSDictionary *originalTweet = dictionary[@"retweeted_status"];
        if(originalTweet != nil){
            NSDictionary *userDictionary = dictionary[@"user"];
            self.retweetedByUser = [[UserModel alloc] initWithDictionary:userDictionary];
        
            // Change tweet to original tweet
            dictionary = originalTweet;
        }
        self.idStr = dictionary[@"id_str"];
        self.text = dictionary[@"text"];
        self.favoriteCount = [dictionary[@"favorite_count"] intValue];
        self.favorited = [dictionary[@"favorited"] boolValue];
        self.retweetCount = [dictionary[@"retweet_count"] intValue];
        self.retweeted = [dictionary[@"retweeted"] boolValue];
        self.createdAtString = dictionary[@"created_at"];
        
        //TODO: initialize user
        NSDictionary *user = dictionary[@"user"];
        self.user = [[UserModel alloc] initWithDictionary:user];
        
        //TODO: Format and set createdAtString
        NSString *createdAtOriginalString = dictionary[@"created_at"];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        // Configure the input format to parse the date string
        formatter.dateFormat = @"E MMM d HH:mm:ss Z y";
        // Convert String to Date
        NSDate *date = [formatter dateFromString:createdAtOriginalString];
        // Configure output format
        formatter.dateStyle = NSDateFormatterShortStyle;
        formatter.timeStyle = NSDateFormatterNoStyle;
        // Convert Date to String
        self.createdAtString = [formatter stringFromDate:date];
    }
    return self;
}

// Factory method
+ (NSMutableArray *)tweetsWithArray:(NSArray *)dictionaries{
    NSMutableArray *tweets = [NSMutableArray array];
    for (NSDictionary *dictionary in dictionaries) {
        TweetModel *tweet = [[TweetModel alloc] initWithDictionary:dictionary];
        [tweets addObject:tweet];
    }
         return tweets;
}

@end
