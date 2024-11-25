//
//  CSRSSFeedItem.h
//  CSFeedKit
//
//  Created by Cătălin Stan on 31/07/16.
//  Copyright © 2016 Cătălin Stan. All rights reserved.
//

#import <CSFeedKit/CSFeedItem.h>
#import <CSFeedKit/CSRSSFeedItemEnclosure.h>

NS_ASSUME_NONNULL_BEGIN

@interface CSRSSFeedItem : CSFeedItem

@property (nonatomic, strong, nullable) NSString *creator;
@property (nonatomic, strong, nullable) CSRSSFeedItemEnclosure *enclosure;

- (instancetype)initWithTitle:(NSString *)title
                         link:(NSString *)link
                  description:(NSString *)description
                      pubDate:(nullable NSDate *)pubDate
                      creator:(nullable NSString *)creator
                    enclosure:(nullable CSRSSFeedItemEnclosure *)enclosure;

@end

NS_ASSUME_NONNULL_END
