//
//  JSQMessageFormatter.m
//  XLMessagesViewControllerDemo
//
//  Created by Madis on 2016/12/5.
//  Copyright © 2016年 Madis. All rights reserved.
//

#import "JSQMessageFormatter.h"
@implementation JSQMessageFormatter

+ (JSQMessage_xl*)messageWithSenderId:(NSString *)senderId
                        displayName:(NSString *)displayName
                           sendDate:(NSString *)sendDate
                               text:(NSString *)text
                     hyperlinkArray:(NSArray <XLHyperlinkData *> *)hyperlinkArray
                 buttonContentArray:(NSArray <XLButtonData *> *)buttonContentArray
{
    if (!hyperlinkArray) {
        hyperlinkArray = [NSArray new];
    }
    if (!buttonContentArray) {
        buttonContentArray = [NSArray new];
    }
    
    JSQMessage_xl *message_hz = nil;
    
    //sendDate(时间戳转date类型)
    NSDate *messageDate = [NSDate date];
    
    //attributedText
    if(hyperlinkArray.count >0){
        //遍历修改超链显示效果
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
        for (XLHyperlinkData *hyperlinkData in hyperlinkArray) {
            NSString *linkURL = hyperlinkData.linkURL;
            NSString *linkText = hyperlinkData.linkText;
            //[UIFont preferredFontForTextStyle:UIFontTextStyleBody]
            [attributedString addAttribute:NSFontAttributeName
                                     value:[UIFont preferredFontForTextStyle:UIFontTextStyleBody]
                                     range:NSMakeRange(0, attributedString.length)];
            [attributedString addAttribute:NSLinkAttributeName
                                     value:linkURL
                                     range:[[attributedString string] rangeOfString:linkText]];
        }
        message_hz = [[JSQMessage_xl alloc] initWithSenderId:senderId
                                           senderDisplayName:displayName
                                                        date:messageDate
                                                        text:text
                                              attributedText:attributedString
                                              hyperlinkArray:hyperlinkArray
                                          buttonContentArray:buttonContentArray];
        message_hz.attributedString = attributedString;
    }else{
        message_hz = [[JSQMessage_xl alloc] initWithSenderId:senderId
                                           senderDisplayName:displayName
                                                        date:messageDate
                                                        text:text
                                              attributedText:nil
                                              hyperlinkArray:hyperlinkArray
                                          buttonContentArray:buttonContentArray];
        message_hz.attributedString = nil;
    }
    
//    message_hz.hyperlinkArray     = hyperlinkArray;
//    message_hz.buttonContentArray = buttonContentArray;
    return message_hz;
}

@end
