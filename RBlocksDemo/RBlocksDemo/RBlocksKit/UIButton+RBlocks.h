//
//  UIButton+RBlocks.h
//  MyInfo
//
//  Created by bwrc on 16/11/17.
//  Copyright © 2016年 bwrc. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^eventBlock)(id sender);

@interface UIButton (RBlocks)

-(void)r_addEvent:(eventBlock)eventHandler andControlEvents:(UIControlEvents)controlEvents;

@end
