//
//  XLMessageViewController.h
//  XLMessagesViewControllerDemo
//
//  Created by Madis on 2016/12/2.
//  Copyright © 2016年 Madis. All rights reserved.
//

#import "JSQMessages.h"
#import "XLMessageViewModel.h"

@interface XLMessageViewController : JSQMessagesViewController

- (id)initWithModel:(XLMessageViewModel *)viewModel;
@end
