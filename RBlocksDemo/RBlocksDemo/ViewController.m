//
//  ViewController.m
//  RBlocksDemo
//
//  Created by bwrc on 16/11/18.
//  Copyright © 2016年 bwrc. All rights reserved.
//

#import "ViewController.h"
#import "RBlocksKit/RBlocksKit.h"

#define WIDTH_SCREEN [UIScreen mainScreen].bounds.size.width
#define HEIGHT_SCREEN [UIScreen mainScreen].bounds.size.height

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self testTap];
    
//    [self testArray];
    
//    [self testThenAndEvent];
    
}
-(void)testTap{
    UIView *tapView = [[UIView alloc] initThen:^(UIView* view) {
        view.frame = CGRectMake(100, 200, WIDTH_SCREEN - 200, 50);
        view.backgroundColor = [UIColor redColor];
        [view r_addTap:^(id sender) {
            NSLog(@"2333");
        }];
    }];
    [self.view addSubview:tapView];
}
-(void)testThenAndEvent{
    UIButton *btn = [[UIButton alloc] initThen:^(UIButton* b) {
        b.frame = CGRectMake(100, 200, WIDTH_SCREEN - 200, 50);
        [b setTitle:@"then" forState:UIControlStateNormal];
        [b setBackgroundColor:[UIColor redColor]];
        [b setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [b r_addEvent:^(id sender) {
            NSLog(@"2333");
        } andControlEvents:UIControlEventTouchUpInside];
    }];
    [self.view addSubview:btn];
    
}


-(void)testArray{
    NSArray *items = @[@"1",@"2",@"3",@"4",@"5"];
    NSArray *changedItems = [items r_map:^id(id obj) {
        NSString *item = obj;
        return [item stringByAppendingString:@"++"];
    }];
    for (NSString *str in changedItems) {
        NSLog(@"%@",str);
    }
    NSArray *secondChangedItems = [changedItems r_any:^BOOL(id obj) {
        NSString *str = obj;
        if ([str isEqual:@"1++"]) {
            return true;
        }else{
            return false;
        }
    }];
    for (NSString *str in secondChangedItems) {
        NSLog(@"%@",str);
    }
}

@end
