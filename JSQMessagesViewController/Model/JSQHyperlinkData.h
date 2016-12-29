//
//  JSQHyperlinkData.h
//  Pods
//
//  Created by Madis on 2016/12/5.
//
//

#import <Foundation/Foundation.h>

@interface JSQHyperlinkData : NSObject

- (id)initWithLinkText:(NSString *)linkText linkURL:(NSString *)linkURL;

//超链内容
@property (copy, nonatomic) NSString *linkText;

//超链地址
@property (copy, nonatomic) NSString *linkURL;

@end
