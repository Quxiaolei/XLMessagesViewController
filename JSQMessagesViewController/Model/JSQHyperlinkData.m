//
//  JSQHyperlinkData.m
//  Pods
//
//  Created by Madis on 2016/12/5.
//
//

#import "JSQHyperlinkData.h"

@implementation JSQHyperlinkData
- (id)init
{
    self = [super init];
    if (self) {
        self.linkText = @"";
        self.linkURL  = @"";
    }
    return self;
}

- (id)initWithLinkText:(NSString *)linkText linkURL:(NSString *)linkURL
{
    self = [super init];
    if (self) {
        self.linkText = linkText;
        self.linkURL  = linkURL;
    }
    return self;
}
@end
