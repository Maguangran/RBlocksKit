//
//  NSArray+RBlocks.m
//  MyInfo
//
//  Created by bwrc on 16/11/17.
//  Copyright © 2016年 bwrc. All rights reserved.
//

#import "NSArray+RBlocks.h"

@implementation NSArray (RBlocks)
-(NSArray *)r_map:(mapBlock)map{
    NSArray *selfArr = self;
    NSMutableArray *tempArr = [NSMutableArray array];
    if (map) {
        for (id obj in selfArr) {
            [tempArr addObject:map(obj)];
        }
    }
    return tempArr.copy;
}
-(NSArray *)r_any:(anyBlock)any{
    NSArray *selfArr = self;
    NSMutableArray *tempArr = [NSMutableArray array];
    if (any) {
        for (id obj in selfArr) {
            if (any(obj)) {
                [tempArr addObject:obj];
            }
        }
    }
    return tempArr.copy;
}
@end
