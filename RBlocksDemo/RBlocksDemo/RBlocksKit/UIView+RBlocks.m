//
//  UIView+RBlocks.m
//  MyInfo
//
//  Created by bwrc on 16/11/18.
//  Copyright © 2016年 bwrc. All rights reserved.
//

#import "UIView+RBlocks.h"
#import <objc/runtime.h>
static NSString *constTapKey;
@interface UIView ()
@property (nonatomic,copy) tapBlock tapBlockIn;
@end
@implementation UIView (RBlocks)
-(void)r_addTap:(tapBlock)tapHandler{
    UIView *tapView = self;
    self.tapBlockIn = tapHandler;
    tapView.userInteractionEnabled = true;
    [tapView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapHandler)]];
}
-(void)tapHandler{
    if (self.tapBlockIn) {
        self.tapBlockIn(self);
    }
}
-(tapBlock)tapBlockIn{
    return objc_getAssociatedObject(self, &constTapKey);
}
-(void)setTapBlockIn:(tapBlock)tapBlockIn{
    objc_setAssociatedObject(self, &constTapKey, tapBlockIn, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
@end
