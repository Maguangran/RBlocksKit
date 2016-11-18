//
//  NSObject+RBlocks.m
//  MyInfo
//
//  Created by bwrc on 16/11/17.
//  Copyright © 2016年 bwrc. All rights reserved.
//

#import "NSObject+RBlocks.h"

@implementation NSObject (RBlocks)
-(instancetype)initThen:(then)thenHandler{
    self = [self init];
    thenHandler(self);
    return self;
}
@end
