//
//  XLMessageContent.m
//  XLMessagesViewControllerDemo
//
//  Created by Madis on 2016/12/5.
//  Copyright © 2016年 Madis. All rights reserved.
//

#import "XLMessageContent.h"

@implementation XLMessageContent
- (id)init
{
    self = [super init];
    if (self) {
    }
    return self;
}
@end


@implementation XLMessageContent_text
- (id)init
{
    self = [super init];
    if (self) {
        self.textContent = @"";
    }
    return self;
}
@end

@implementation XLMessageContent_image
- (id)init
{
    self = [super init];
    if (self) {
        self.imageURL    = @"";
        self.bigImageURL = @"";
    }
    return self;
}
@end


@implementation XLMessageContent_hyperlink
- (id)init
{
    self = [super init];
    if (self) {
        self.hyperlinkContent = @"";
        self.linkTarget       = @"";
    }
    return self;
}
@end

@implementation XLMessageContent_button
- (id)init
{
    self = [super init];
    if (self) {
        self.buttonContent = @"";
        self.linkTarget    = @"";
    }
    return self;
}
@end
