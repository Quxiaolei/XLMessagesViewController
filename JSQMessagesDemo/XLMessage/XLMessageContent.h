//
//  XLMessageContent.h
//  XLMessagesViewControllerDemo
//
//  Created by Madis on 2016/12/5.
//  Copyright © 2016年 Madis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XLMessageContent : NSObject


@end

/**
 纯文本类消息内容,无交互
 */
@interface XLMessageContent_text : XLMessageContent
//text内容
@property (nonatomic, copy) NSString *textContent;

@end

/**
 图片消息内容,点击图片放大
 */
@interface XLMessageContent_image : XLMessageContent
//image地址
@property (nonatomic, copy) NSString *imageURL;
//大图地址
@property (nonatomic, copy) NSString *bigImageURL;

@end

/**
 文本超链类消息内容,点击交互进入h5界面
 */
@interface XLMessageContent_hyperlink : XLMessageContent
//text内容
@property (nonatomic, copy) NSString *hyperlinkContent;
//h5页面地址
@property (nonatomic, copy) NSString *linkTarget;

@end

/**
 按钮类消息内容,点击按钮进入原生的界面(需要相关原生的界面数据)
 */
@interface XLMessageContent_button : XLMessageContent
//按钮文本内容
@property (nonatomic, copy) NSString *buttonContent;
//目标地址
@property (nonatomic, copy) NSString *linkTarget;

@end
