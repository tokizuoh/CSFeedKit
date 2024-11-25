//
//  CSRSSFeedItem.m
//  CSFeedKit
//
//  Created by Cătălin Stan on 31/07/16.
//  Copyright © 2016 Cătălin Stan. All rights reserved.
//

#import <CSFeedKit/CSRSSFeedItem.h>
#import <CSFeedKit/CSRSSFeedItemEnclosure.h>

@implementation CSRSSFeedItem

- (instancetype)initWithTitle:(NSString *)title
                         link:(NSString *)link
                  description:(NSString *)description
                      pubDate:(nullable NSDate *)pubDate
                      creator:(nullable NSString *)creator
                    enclosure:(nullable CSRSSFeedItemEnclosure *)enclosure {
    self = [super initWithTitle:title link:link description:description];
    if (self) {
        self.pubDate = pubDate;
        self.creator = creator;
        self.enclosure = enclosure;
    }
    return self;
}

- (instancetype)initWithXMLElement:(NSXMLElement *)element {
    self = [super initWithXMLElement:element];
    if ( self != nil ) {
        self.creator = [element elementsForName:@"dc:creator"].firstObject.stringValue;
        
        NSXMLElement *enclosureElement;
        if ((enclosureElement = [element elementsForName:@"enclosure"].firstObject)) {
            self.enclosure = [[CSRSSFeedItemEnclosure alloc] initWithXMLElement:enclosureElement];
        }
    }
    return self;
}

- (NSXMLElement *)XMLElement {
    NSXMLElement * element = [super XMLElement];
    
    if (self.creator.length) {
        [element addChild:[NSXMLElement elementWithName:@"dc:creator" stringValue:self.creator]];
    }
    
    if (self.enclosure) {
        [element addChild:self.enclosure.XMLElement];
    }
        
    return element;
}

@end
