//
//  UIButton+RBlocks.m
//  MyInfo
//
//  Created by bwrc on 16/11/17.
//  Copyright © 2016年 bwrc. All rights reserved.
//

#import "UIButton+RBlocks.h"
#import <objc/runtime.h>
static NSString *const eventKey;
@interface UIButton ()
@property (nonatomic,copy) eventBlock eventIn;
@end
@implementation UIButton (RBlocks)
-(void)r_addEvent:(eventBlock)eventHandler andControlEvents:(UIControlEvents)controlEvents{
    UIButton *btn = self;
    self.eventIn = eventHandler;
    [btn addTarget:self action:@selector(btnTouchWithEvent) forControlEvents:controlEvents];
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
