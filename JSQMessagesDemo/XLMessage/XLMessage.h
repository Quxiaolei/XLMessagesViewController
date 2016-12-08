//
//  XLMessage.h
//  XLMessagesViewControllerDemo
//
//  Created by Madis on 2016/12/5.
//  Copyright © 2016年 Madis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XLMessageContent.h"

@interface XLMessage : NSObject
/** 表ID */
@property (nonatomic, copy) NSString *tableID;
/** 消息ID 可能为空*/
@property (nonatomic, copy) NSString *msgID;
/** 发送方 userID*/
@property (nonatomic, copy) NSString *fromUserID;
/** 会话ID*/
@property (nonatomic, copy) NSString *conversationID;
/** 消息内容*/
/**
 存放消息内容,内部可以任意组合
 优先级:XLMessageContent_image > XLMessageContent_text > XLMessageContent_hyperlink > XLMessageContent_button
 */
@property (nonatomic,strong) NSArray <XLMessageContent *>*messageContentArray;
/** 是否已读 */
@property (nonatomic, assign) BOOL isRead;
/** 是否已发送 */
@property (nonatomic, assign) BOOL isSend;
// 是否正在发送
@property (nonatomic, assign) BOOL isSending;
/** 发送消息时间 */
@property (nonatomic, copy) NSString *insertTime;
/** 更新时间 */
@property (nonatomic, copy) NSString *updateTime;
@end
