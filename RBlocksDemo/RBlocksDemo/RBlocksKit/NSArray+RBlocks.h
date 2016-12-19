//
//  NSArray+RBlocks.h
//  MyInfo
//
//  Created by bwrc on 16/11/17.
//  Copyright © 2016年 bwrc. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef id(^mapBlock) (id obj);
typedef BOOL(^anyBlock) (id obj);
typedef BOOL(^fitBlock) (id obj);

@interface NSArray (RBlocks)

/**
 将数组中的每个元素进行操作,然后返回新数组
 
 @param map map

 @return 新数组
 */
-(NSArray*)r_map:(mapBlock)map;

/**
 选择数组中符合条件的元素

 @param any 条件,BOOL
 
 @return 符合条件的数组
 */
-(NSArray*)r_any:(anyBlock)any;

/**
 数组中元素是否全部符合某个条件

 @param fit 条件

 @return 是否全部符合给定条件
 */
-(BOOL)r_fit:(fitBlock)fit;

@end
