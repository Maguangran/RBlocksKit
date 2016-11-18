//
//  NSObject+RBlocks.h
//  MyInfo
//
//  Created by bwrc on 16/11/17.
//  Copyright © 2016年 bwrc. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^then)(id obj);
@interface NSObject (RBlocks)
-(instancetype)initThen:(then)thenHandler;
@end
