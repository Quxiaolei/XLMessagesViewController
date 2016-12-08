//
//  JSQMessage_hz.h
//  XLMessagesViewControllerDemo
//
//  Created by Madis on 2016/12/5.
//  Copyright © 2016年 Madis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XLHyperlinkData.h"
#import "XLButtonData.h"

@interface JSQMessage_xl : JSQMessage

//消息显示时间
@property (nonatomic, copy  ) NSString       *showTime;
//当前时间时间戳
@property (nonatomic, assign) NSTimeInterval timeIntervalToNow;
//是否显示时间
@property (nonatomic, assign) BOOL           isHiddenTime;

//超链地址数组
@property (strong, nonatomic) NSArray <XLHyperlinkData *> *hyperlinkArray;
//按钮数据数组
@property (strong, nonatomic) NSArray <XLButtonData    *> *buttonContentArray;

//富文本
@property (copy, nonatomic) NSMutableAttributedString *attributedString;

@end
