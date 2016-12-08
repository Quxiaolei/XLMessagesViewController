//
//  XLMessageViewModel.m
//  XLMessagesViewControllerDemo
//
//  Created by Madis on 2016/12/2.
//  Copyright © 2016年 Madis. All rights reserved.
//

#import "XLMessageViewModel.h"
static NSString * const kJSQDemoAvatarDisplayNameSquires = @"Jesse Squires";
static NSString * const kJSQDemoAvatarDisplayNameCook = @"Tim Cook";
static NSString * const kJSQDemoAvatarDisplayNameJobs = @"Jobs";
static NSString * const kJSQDemoAvatarDisplayNameWoz = @"Steve Wozniak";

static NSString * const kJSQDemoAvatarIdSquires = @"053496-4509-289";
static NSString * const kJSQDemoAvatarIdCook = @"468-768355-23123";
static NSString * const kJSQDemoAvatarIdJobs = @"1";
static NSString * const kJSQDemoAvatarIdWoz = @"309-41802-93823";

@implementation XLMessageViewModel

- (id)init
{
    self = [super init];
    if (self) {
        [self initData];
    }
    return self;
}

- (void)initData
{
//    This is an example by marcelofabri_
    
    NSMutableArray *hyperlinkArray = [NSMutableArray arrayWithCapacity:0];
    [hyperlinkArray addObject:[[XLHyperlinkData alloc] initWithLinkText:@"This" linkURL:@"https://www.baidu.com/index.php?tn=monline_1_dg"]];
    [hyperlinkArray addObject:[[XLHyperlinkData alloc] initWithLinkText:@"example" linkURL:@"https://www.baidu.com/index.php?tn=monline_2_dg"]];
    [hyperlinkArray addObject:[[XLHyperlinkData alloc] initWithLinkText:@"marcelofabri_" linkURL:@"https://www.baidu.com/index.php?tn=monline_3_dg"]];

    NSMutableArray *buttonContentArray = [NSMutableArray arrayWithCapacity:0];
    [buttonContentArray addObject:[[XLButtonData alloc] initWithContent:@"hello"]];
    NSArray *buttonArray1 = [buttonContentArray copy];
    [buttonContentArray addObject:[[XLButtonData alloc] initWithContent:@"test1"]];
    NSArray *buttonArray2 = [buttonContentArray copy];
    [buttonContentArray addObject:[[XLButtonData alloc] initWithContent:@"test2"]];
    NSArray *buttonArray3 = [buttonContentArray copy];

    self.messages = [[NSMutableArray alloc] initWithObjects:
                     [JSQMessageFormatter messageWithSenderId:kJSQDemoAvatarIdSquires displayName:kJSQDemoAvatarDisplayNameSquires sendDate:@"1480931028" text:@"This is an example \n marcelofabri_It even has data detectors. You can call me tonight. My cell number is 1 . My website iswww.baidu.com \n www1.hexedbits.com." hyperlinkArray:hyperlinkArray buttonContentArray:buttonArray1],
                     [JSQMessageFormatter messageWithSenderId:kJSQDemoAvatarIdSquires displayName:kJSQDemoAvatarDisplayNameSquires sendDate:@"1480931028" text:@"This is an example \n marcelofabri_It even has data detectors. You can call me tonight. My cell number is 1 . My website is \n www1.hexedbits.com." hyperlinkArray:hyperlinkArray buttonContentArray:buttonArray2],
                     [JSQMessageFormatter messageWithSenderId:kJSQDemoAvatarIdSquires displayName:kJSQDemoAvatarDisplayNameSquires sendDate:@"1480931028" text:@"Thi1s is an example by It even has data detectors. You can call me tonight. My cell number is 1 . My website is \n www1.hexedbits.com. marcelofabri_" hyperlinkArray:hyperlinkArray buttonContentArray:buttonArray3],
                     [JSQMessageFormatter messageWithSenderId:kJSQDemoAvatarIdSquires displayName:kJSQDemoAvatarDisplayNameSquires sendDate:@"1480931028" text:@"Thi1s is an example by marcelofabri_ It even has data detectors. You can call me tonight. My cell number is 1 . My website is \n www1.hexedbits.com." hyperlinkArray:hyperlinkArray buttonContentArray:buttonArray2],
                     [JSQMessageFormatter messageWithSenderId:kJSQDemoAvatarIdJobs
                                                  displayName:kJSQDemoAvatarDisplayNameSquires sendDate:@"1480931028" text:@"Thi1s is an example by marcelofabri_ It even has data detectors. You can call me tonight. My cell number is 1 . My website is \n www1.hexedbits.com.2" hyperlinkArray:nil buttonContentArray:buttonArray3],
                     [JSQMessageFormatter messageWithSenderId:kJSQDemoAvatarIdSquires displayName:kJSQDemoAvatarDisplayNameSquires sendDate:@"1480931028" text:@"This is an example \n marcelofabri_It even has data detectors. You can call me tonight. My cell number is 1 . My website iswww.baidu.com \n www1.hexedbits.com." hyperlinkArray:hyperlinkArray buttonContentArray:[NSArray new]],
                     [JSQMessageFormatter messageWithSenderId:kJSQDemoAvatarIdSquires displayName:kJSQDemoAvatarDisplayNameSquires sendDate:@"1480931028" text:@"This is an example \n marcelofabri_It even has data detectors. You can call me tonight. My cell number is 1 . My website is \n www1.hexedbits.com." hyperlinkArray:hyperlinkArray buttonContentArray:buttonArray3],
                     [JSQMessageFormatter messageWithSenderId:kJSQDemoAvatarIdSquires displayName:kJSQDemoAvatarDisplayNameSquires sendDate:@"1480931028" text:@"Thi1s is an example by It even has data detectors. You can call me tonight. My cell number is 1 . My website is \n www1.hexedbits.com. marcelofabri_" hyperlinkArray:hyperlinkArray buttonContentArray:buttonArray2],
                     [JSQMessageFormatter messageWithSenderId:kJSQDemoAvatarIdSquires displayName:kJSQDemoAvatarDisplayNameSquires sendDate:@"1480931028" text:@"Thi1s is an example by marcelofabri_ It even has data detectors. You can call me tonight. My cell number is 1 . My website is \n www1.hexedbits.com." hyperlinkArray:hyperlinkArray buttonContentArray:buttonArray1],
                     [JSQMessageFormatter messageWithSenderId:kJSQDemoAvatarIdJobs
                                                  displayName:kJSQDemoAvatarDisplayNameSquires sendDate:@"1480931028" text:@"Thi1s is an example by marcelofabri_ It even has data detectors. You can call me tonight. My cell number is 1 . My website is \n www1.hexedbits.com." hyperlinkArray:nil buttonContentArray:nil],
                     
                     nil];
    JSQPhotoMediaItem *photoItem = [[JSQPhotoMediaItem alloc] initWithImage:[UIImage imageNamed:@"goldengate"]];
    photoItem.appliesMediaViewMaskAsOutgoing = NO;
    JSQMessage *photoMessage = [JSQMessage messageWithSenderId:kJSQDemoAvatarIdSquires
                                                   displayName:kJSQDemoAvatarDisplayNameSquires
                                                         media:photoItem];
    [self.messages addObject:photoMessage];

    
//    self.messages = [[NSMutableArray alloc] initWithObjects:
//                     [[JSQMessage alloc] initWithSenderId:kJSQDemoAvatarIdSquires
//                                        senderDisplayName:kJSQDemoAvatarDisplayNameSquires
//                                                     date:[NSDate distantPast]
//                                                     text:@"Welcome to JSQMessages: A messaging UI framework for iOS."],
//                     
//                     [[JSQMessage alloc] initWithSenderId:kJSQDemoAvatarIdWoz
//                                        senderDisplayName:kJSQDemoAvatarDisplayNameWoz
//                                                     date:[NSDate distantPast]
//                                                     text:@"It is simple, elegant, and easy to use. There are super sweet default settings, but you can customize like crazy."],
//                     
//                     [[JSQMessage alloc] initWithSenderId:kJSQDemoAvatarIdSquires
//                                        senderDisplayName:kJSQDemoAvatarDisplayNameSquires
//                                                     date:[NSDate distantPast]
//                                                     text:@"It even has data detectors. You can call me tonight. My cell number is 123-456-7890. My website is \n www.hexedbits.com."],
//                     
//                     [[JSQMessage alloc] initWithSenderId:kJSQDemoAvatarIdJobs
//                                        senderDisplayName:kJSQDemoAvatarDisplayNameJobs
//                                                     date:[NSDate date]
//                                                     text:@"JSQMessagesViewController is nearly an exact replica of the iOS Messages App. And perhaps, better."],
//                     
//                     [[JSQMessage alloc] initWithSenderId:kJSQDemoAvatarIdCook
//                                        senderDisplayName:kJSQDemoAvatarDisplayNameCook
//                                                     date:[NSDate date]
//                                                     text:@"It is unit-tested, free, open-source, and documented."],
//                     
//                     [[JSQMessage alloc] initWithSenderId:kJSQDemoAvatarIdSquires
//                                        senderDisplayName:kJSQDemoAvatarDisplayNameSquires
//                                                     date:[NSDate date]
//                                                     text:@"Now with media messages!"], [[JSQMessage alloc] initWithSenderId:kJSQDemoAvatarIdJobs
//                                                                                                           senderDisplayName:kJSQDemoAvatarDisplayNameJobs
//                                                                                                                        date:[NSDate date]
//                                                                                                                        text:@"JSQMessagesViewController is nearly an exact replica of the iOS Messages App. And perhaps, better."],
//                     
//                     [[JSQMessage alloc] initWithSenderId:kJSQDemoAvatarIdCook
//                                        senderDisplayName:kJSQDemoAvatarDisplayNameCook
//                                                     date:[NSDate date]
//                                                     text:@"It is unit-tested, free, open-source, and documented."],
//                     
//                     [[JSQMessage alloc] initWithSenderId:kJSQDemoAvatarIdSquires
//                                        senderDisplayName:kJSQDemoAvatarDisplayNameSquires
//                                                     date:[NSDate date]
//                                                     text:@"Now with media messages!"],
//                     nil];
}
@end
