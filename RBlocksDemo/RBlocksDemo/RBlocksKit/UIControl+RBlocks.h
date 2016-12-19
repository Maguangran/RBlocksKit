//
//  UIControl+RBlocks.h
//  RBlocksDemo
//
//  Created by bwrc on 16/12/19.
//  Copyright © 2016年 bwrc. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^eventBlock)(id sender);

@interface UIControl (RBlocks)
-(void)r_addEvent:(eventBlock)eventHandler andControlEvents:(UIControlEvents)controlEvents;

@end
