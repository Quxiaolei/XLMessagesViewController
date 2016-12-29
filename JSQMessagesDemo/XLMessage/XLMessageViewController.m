//
//  XLMessageViewController.m
//  XLMessagesViewControllerDemo
//
//  Created by Madis on 2016/12/2.
//  Copyright © 2016年 Madis. All rights reserved.
//

#import "XLMessageViewController.h"

@interface XLMessageViewController ()
@property (nonatomic,strong)XLMessageViewModel *viewModel;
@end

@implementation XLMessageViewController
- (id)init
{
    self = [super init];
    if (self) {
    }
    return self;
}
- (id)initWithModel:(XLMessageViewModel *)viewModel
{
    self = [super init];
    if (self) {
        self.viewModel = viewModel;
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    self.collectionView.collectionViewLayout.messageBubbleLeftRightMargin = 20.0f;\
    
    //[UIFont preferredFontForTextStyle:UIFontTextStyleBody]
    self.collectionView.collectionViewLayout.messageBubbleFont = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    
    self.automaticallyScrollsToMostRecentMessage = YES;
    [self scrollToBottomAnimated:NO];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //    self.navigationController.title = @"消息详情";
    self.title = @"消息";
    
    UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(back)];
    self.navigationController.navigationItem.leftBarButtonItem = leftBarButton;
}

- (JSQMessage_xl *)messageInMessagesAtIndex:(NSUInteger)index
{
    NSArray *array = self.viewModel.messages;
    JSQMessage_xl *message = nil;
    if (index >= [array count]) {
        message = [array lastObject];
    } else {
        message = [array objectAtIndex:index];
    }
    return message;
}

#pragma mark - JSQMessages CollectionView DataSource
- (id<JSQMessageData>)collectionView:(JSQMessagesCollectionView *)collectionView messageDataForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return [self messageInMessagesAtIndex:indexPath.row];
}

//头像
- (id<JSQMessageAvatarImageDataSource>)collectionView:(JSQMessagesCollectionView *)collectionView avatarImageDataForItemAtIndexPath:(NSIndexPath *)indexPath
{
    JSQMessage_xl *message = [self messageInMessagesAtIndex:indexPath.item];
    
    UIImage *image = [UIImage imageNamed:@"默认头像灰"];
    if([message.senderId isEqualToString:@"1"]){
        image = [UIImage imageNamed:@"demo_avatar_jobs"];
    }
    JSQMessagesAvatarImage *cookImage = [JSQMessagesAvatarImageFactory avatarImageWithImage:image
                                                                                   diameter:kJSQMessagesCollectionViewAvatarSizeDefault];
    return cookImage;
}

//消息气泡
- (id<JSQMessageBubbleImageDataSource>)collectionView:(JSQMessagesCollectionView *)collectionView messageBubbleImageDataForItemAtIndexPath:(NSIndexPath *)indexPath
{
    JSQMessage_xl *message = [self messageInMessagesAtIndex:indexPath.item];
    
    JSQMessagesBubbleImageFactory *bubbleFactory = [[JSQMessagesBubbleImageFactory alloc] init];
    JSQMessagesBubbleImage *incomingBubbleImageData = [bubbleFactory incomingMessagesBubbleImageWithColor:[UIColor jsq_messageBubbleLightGrayColor]];
    JSQMessagesBubbleImage *outgoingBubbleImageData = [bubbleFactory outgoingMessagesBubbleImageWithColor:[UIColor jsq_messageBubbleGreenColor]];


    if ([message.senderId isEqualToString:@"1"]) {
        return outgoingBubbleImageData;
    }
    return incomingBubbleImageData;
}

- (NSArray<NSString *> *)collectionView:(JSQMessagesCollectionView *)collectionView textArrayForCellContentButtonAtIndexPath:(NSIndexPath *)indexPath
{
    JSQMessage_xl *message = [self messageInMessagesAtIndex:indexPath.item];
    if (!message.isMediaMessage && message.buttonContentArray.count >0) {
        NSMutableArray *buttonTitleArray = [NSMutableArray arrayWithCapacity:message.buttonContentArray.count];
        for (XLButtonData *buttonData in message.buttonContentArray) {
            [buttonTitleArray addObject:buttonData.btnContent];
        }
        return buttonTitleArray;
    }
    return @[];
}

//顶部显示时间label
- (NSAttributedString *)collectionView:(JSQMessagesCollectionView *)collectionView attributedTextForCellTopLabelAtIndexPath:(NSIndexPath *)indexPath
{
    JSQMessage_xl *message = [self messageInMessagesAtIndex:indexPath.item];
    
//    if (message.isHiddenTime) {
//        return nil;
//        return [[JSQMessagesTimestampFormatter sharedFormatter] attributedTimestampForDate:message.date];
//    }
    return [[JSQMessagesTimestampFormatter sharedFormatter] attributedTimestampForDate:message.date];
}
//顶部显示发送者名称label
- (NSAttributedString *)collectionView:(JSQMessagesCollectionView *)collectionView attributedTextForMessageBubbleTopLabelAtIndexPath:(NSIndexPath *)indexPath
{
    JSQMessage_xl *message = [self messageInMessagesAtIndex:indexPath.item];
    
    //    if (nil == message)
    //        return nil;
    
    if ([message.senderId isEqualToString:self.senderId]) {
        return nil;
    }
    if (indexPath.item - 1 > 0) {
        JSQMessage_xl *previousMessage = [self messageInMessagesAtIndex:indexPath.item - 1];
        if ([[previousMessage senderId] isEqualToString:message.senderId]) {
            return nil;
        }
    }
    return [[NSAttributedString alloc] initWithString:message.senderDisplayName];
}
//底部label
- (NSAttributedString *)collectionView:(JSQMessagesCollectionView *)collectionView attributedTextForCellBottomLabelAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}
#pragma mark - UICollectionView DataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSArray*array = self.viewModel.messages;
    MSLog(@"UICollectionView count: %lu", [array count]);
    return [array count];
}

- (UICollectionViewCell *)collectionView:(JSQMessagesCollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    // TODO-612：转圈 + 感叹号，点击后重发，抛出事件
    JSQMessagesCollectionViewCell *cell = (JSQMessagesCollectionViewCell *)[super collectionView:collectionView cellForItemAtIndexPath:indexPath];
    
//    JSQMessagesCollectionViewCellIncoming *cell = (JSQMessagesCollectionViewCellIncoming *)[super collectionView:collectionView cellForItemAtIndexPath:indexPath];
    
//    if (nil == cell.viewModel)
//    {
//        JSQMessage *message = [self messageInMessagesAtIndex:indexPath.item];
//        cell.viewModel = [[ConversationCellViewModel alloc] initWithModel:message];
//    }
    
    return cell;
}

#pragma mark - Adjusting cell label heights
//设置时间label高度
- (CGFloat)collectionView:(JSQMessagesCollectionView *)collectionView
                   layout:(JSQMessagesCollectionViewFlowLayout *)collectionViewLayout heightForCellTopLabelAtIndexPath:(NSIndexPath *)indexPath
{
    //FIXME: 时间隐藏时,高度为20,不隐藏时为40
    JSQMessage_xl *message = [self messageInMessagesAtIndex:indexPath.item];
    return kJSQMessagesCollectionViewCellLabelHeightDefault;
//    message.isHiddenTime?kJSQMessagesCollectionViewCellLabelHeightDefault/2.0f:kJSQMessagesCollectionViewCellLabelHeightDefault;
}
//设置消息气泡上label的高度
- (CGFloat)collectionView:(JSQMessagesCollectionView *)collectionView
                   layout:(JSQMessagesCollectionViewFlowLayout *)collectionViewLayout heightForMessageBubbleTopLabelAtIndexPath:(NSIndexPath *)indexPath
{
    //    JSQMessage *currentMessage = [self.messageArray objectAtIndex:indexPath.item];
    //    if ([[currentMessage senderId] isEqualToString:self.senderId]) {
    //        return 0.0f;
    //    }
    //    if (indexPath.item - 1 > 0) {
    //        JSQMessage *previousMessage = [self.messageArray objectAtIndex:indexPath.item - 1];
    //        if ([[previousMessage senderId] isEqualToString:[currentMessage senderId]]) {
    //            return 0.0f;
    //        }
    //    }
    //    return kJSQMessagesCollectionViewCellLabelHeightDefault;
    //不能用CGFLOAT_MIN
    return 0.0f;
}
//单元格底部label高度
- (CGFloat)collectionView:(JSQMessagesCollectionView *)collectionView
                   layout:(JSQMessagesCollectionViewFlowLayout *)collectionViewLayout heightForCellBottomLabelAtIndexPath:(NSIndexPath *)indexPath
{
    return CGFLOAT_MIN;
}

#pragma mark - Responding to collection view tap events

//点击加载之前消息
- (void)collectionView:(JSQMessagesCollectionView *)collectionView
                header:(JSQMessagesLoadEarlierHeaderView *)headerView didTapLoadEarlierMessagesButton:(UIButton *)sender
{
    NSLog(@"Load earlier messages!");
//    [self.viewModel buttonLoadMoreMessageClicked];
}

//重新发送
- (void)collectionView:(JSQMessagesCollectionView *)collectionView didTapSendStatusButtonAtIndexPath:(NSIndexPath *)indexPath
{
    JSQMessagesCollectionViewCell *cell = (JSQMessagesCollectionViewCell*)[collectionView cellForItemAtIndexPath:indexPath];
    //    [cell.viewModel statusButtonClickForReSend];
    
//    [self.viewModel statusButtonClickForReSendWithJSQMessage:cell.viewModel.model];
}
//点击头像
- (void)collectionView:(JSQMessagesCollectionView *)collectionView didTapAvatarImageView:(UIImageView *)avatarImageView atIndexPath:(NSIndexPath *)indexPath
{
    MSLog(@"Tapped avatar!");
    [self.view endEditing:YES];
    JSQMessagesCollectionViewCell *cell = (JSQMessagesCollectionViewCell*)[collectionView cellForItemAtIndexPath:indexPath];
    //跳转个人信息
}
//点击消息气泡
- (void)collectionView:(JSQMessagesCollectionView *)collectionView didTapMessageBubbleAtIndexPath:(NSIndexPath *)indexPath
{
    MSLog(@"Tapped message bubble!");
    JSQMessage_xl *message = [self messageInMessagesAtIndex:indexPath.item];
    if(message.isMediaMessage){
        //多媒体消息点击效果
    }
}
//点击单元格
- (void)collectionView:(JSQMessagesCollectionView *)collectionView didTapCellAtIndexPath:(NSIndexPath *)indexPath touchLocation:(CGPoint)touchLocation
{
    MSLog(@"Tapped cell at %@!", NSStringFromCGPoint(touchLocation));
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.view endEditing:YES];
    });
}
- (BOOL)collectionView:(JSQMessagesCollectionView *)collectionView hyperlinkClickedWithURL:(NSURL *)hyperlinkURL atIndexPath:(NSIndexPath *)indexPath
{
    MSLog(@"李磊---%@",hyperlinkURL);
    return YES;
}

//点击cell中的contentButton
- (void)collectionView:(JSQMessagesCollectionView *)collectionView contentButtonClicked:(UIButton *)button atIndexPath:(NSIndexPath *)indexPath
{
    MSLog(@"李磊-%ld",button.tag);
}

#pragma mark - target action

- (void)jsq_loginViewClicked:(id)sender
{
    MSLog(@"loginViewClicked");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)back
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
@end
