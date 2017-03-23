//
//  MyScrollerView.h
//  中英对照连线题
//
//  Created by 唐天成 on 2016/11/20.
//  Copyright © 2016年 唐天成. All rights reserved.
//

#import <UIKit/UIKit.h>
#define KWIDTH_IPHONE6_SCALE      ([UIScreen mainScreen].bounds.size.width/375.0f)

@interface MyScrollerView : UIScrollView
@property (nonatomic, assign) NSInteger count;
@end
