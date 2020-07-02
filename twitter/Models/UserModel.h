//
//  UserModel.h
//  twitter
//
//  Created by fdadzie20 on 6/30/20.
//  Copyright © 2020 Emerson Malca. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserModel : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *screenName;
//...


- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
