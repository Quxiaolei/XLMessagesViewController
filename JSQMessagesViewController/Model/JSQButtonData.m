//
//  JSQButtonData.m
//  JSQMessagesViewControllerDemo
//
//  Created by Madis on 2016/12/8.
//  Copyright © 2016年 Madis. All rights reserved.
//

#import "JSQButtonData.h"

@implementation JSQButtonData

- (id)initWithBtnContent:(NSString *)btnContent
{
    self = [super init];
    if (self) {
        self.btnContent = btnContent;
    }
    return self;
}
@end
