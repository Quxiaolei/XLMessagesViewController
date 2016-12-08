//
//  JSQMessageFormatter.h
//  XLMessagesViewControllerDemo
//
//  Created by Madis on 2016/12/5.
//  Copyright © 2016年 Madis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSQMessage_xl.h"

@interface JSQMessageFormatter : NSObject

+ (JSQMessage_xl *)messageWithSenderId:(NSString *)senderId
                        displayName:(NSString *)displayName
                           sendDate:(NSString *)sendDate
                               text:(NSString *)text
                     hyperlinkArray:(NSArray <XLHyperlinkData *> *)hyperlinkArray
                 buttonContentArray:(NSArray <XLButtonData *> *)buttonContentArray;
@end
