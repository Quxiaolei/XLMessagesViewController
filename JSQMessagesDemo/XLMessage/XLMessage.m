//
//  XLMessage.m
//  XLMessagesViewControllerDemo
//
//  Created by Madis on 2016/12/5.
//  Copyright © 2016年 Madis. All rights reserved.
//

#import "XLMessage.h"

@implementation XLMessage

- (id)init
{
    self = [super init];
    if (self) {
        self.tableID        = @"";
        self.msgID          = @"";
        self.fromUserID     = @"";
        self.conversationID = @"";
        self.messageContentArray = [NSArray new];
        self.isRead    = NO;
        self.isSend    = NO;
        self.isSending = NO;
        self.insertTime = @"";
        self.updateTime = @"";
    }
    return self;
}
@end
