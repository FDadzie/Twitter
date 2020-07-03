//
//  UserModel.m
//  twitter
//
//  Created by fdadzie20 on 6/30/20.
//  Copyright © 2020 Emerson Malca. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.name = dictionary[@"name"];
        self.screenName = dictionary[@"screen_name"];
        self.profileImageUrl = dictionary[@"profile_image_url_https"];
    }
    return self;
}

@end
