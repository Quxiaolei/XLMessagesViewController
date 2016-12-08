//
//  XLButtonData.m
//  XLMessagesViewControllerDemo
//
//  Created by Madis on 2016/12/8.
//  Copyright © 2016年 Madis. All rights reserved.
//

#import "XLButtonData.h"

@implementation XLButtonData

- (id)initWithContent:(NSString *)content
{
    self = [super init];
    if (self) {
        self.content = content;
    }
    return self;
}
@end
