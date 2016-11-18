//
//  UIView+RBlocks.h
//  MyInfo
//
//  Created by bwrc on 16/11/18.
//  Copyright © 2016年 bwrc. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^tapBlock)(id sender);

@interface UIView (RBlocks)

/**
 给视图添加手势,默认是可交互的

 @param tapHandler 交互过程
 */
-(void)r_addTap:(tapBlock)tapHandler ;

@end
