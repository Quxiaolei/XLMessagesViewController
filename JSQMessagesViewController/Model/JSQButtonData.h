//
//  JSQButtonData.h
//  JSQMessagesViewControllerDemo
//
//  Created by Madis on 2016/12/8.
//  Copyright © 2016年 Madis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSQButtonData : NSObject

- (id)initWithBtnContent:(NSString *)btnContent;

//按钮描述文本
@property (copy, nonatomic) NSString *btnContent;

@end
