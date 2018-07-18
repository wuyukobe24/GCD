//
//  DispatchAfter.m
//  GCD
//
//  Created by WangXueqi on 2018/7/6.
//  Copyright © 2018年 JingBei. All rights reserved.
//

#import "DispatchAfter.h"

@implementation DispatchAfter

//10.GCD延时执行方法
+ (instancetype)DispatchAfterManager {
    return [[self alloc]initDispatchAfterManager];
}

- (instancetype)initDispatchAfterManager {
    if (self = [super init]) {
        [self dispatchAfter];
    }
    return self;
}

- (void)dispatchAfter {
    NSLog(@"currentThread---%@",[NSThread currentThread]);  //打印当前线程
    NSLog(@"dispatchAfter---begin");
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0*NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"after---%@",[NSThread currentThread]);      //打印当前线程
    });
    NSLog(@"dispatchAfter---end");
}

/**
 注意：dispatch_after函数并不是在指定时间之后才开始执行处理，而是在指定时间之后将任务追加到主队列中。严格来说，这个时间并不是绝对准确的，但想要大致延迟执行任务，dispatch_after函数是很有效的。
 */
@end
