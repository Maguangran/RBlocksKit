//
//  UIControl+RBlocks.m
//  RBlocksDemo
//
//  Created by bwrc on 16/12/19.
//  Copyright © 2016年 bwrc. All rights reserved.
//

#import "UIControl+RBlocks.h"
#import <objc/runtime.h>
static NSString *const eventKey;
@interface UIControl ()
@property (nonatomic,copy) eventBlock eventIn;
@end
@implementation UIButton (RBlocks)
-(void)r_addEvent:(eventBlock)eventHandler andControlEvents:(UIControlEvents)controlEvents{
    UIControl *c = self;
    self.eventIn = eventHandler;
    [c addTarget:self action:@selector(btnTouchWithEvent) forControlEvents:controlEvents];
}
-(eventBlock)eventIn{
    return objc_getAssociatedObject(self, &eventKey);
}
-(void)setEventIn:(eventBlock)eventIn{
    objc_setAssociatedObject(self, &eventKey, eventIn, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
-(void)btnTouchWithEvent{
    if (self.eventIn) {
        self.eventIn(self);
    }
}

@end
