//
//  DispatchApply.m
//  GCD
//
//  Created by WangXueqi on 2018/7/6.
//  Copyright © 2018年 JingBei. All rights reserved.
//

#import "DispatchApply.h"

@implementation DispatchApply

//12.GCD 快速迭代方法：dispatch_apply
+ (instancetype)DispatchApplyManager {
    return [[self alloc]initDispatchApplyManager];
}

- (instancetype)initDispatchApplyManager {
    if (self = [super init]) {
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        NSLog(@"apply---begin");
        dispatch_apply(5, queue, ^(size_t index) {
            NSLog(@"%ld --- %@",index,[NSThread currentThread]);
        });
        NSLog(@"apply---end");
    }
    return self;
}
/**
 1.dispatch_apply按照指定的次数将指定的任务追加到指定的队列中，并等待全部队列执行结束。
 2.因为是在并发队列中异步执行任务，所以各个任务的执行时间长短不定，最后结束顺序也不定。但是apply---end一定在最后执行。这是因为dispatch_apply函数会等待全部任务执行完毕。
 */
@end
