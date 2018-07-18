//
//  DispatchBarrierAsync.m
//  GCD
//
//  Created by WangXueqi on 2018/7/6.
//  Copyright © 2018年 JingBei. All rights reserved.
//

#import "DispatchBarrierAsync.h"

@implementation DispatchBarrierAsync

// 9.GCD栅栏方法
+ (instancetype)DispatchBarrierAsync {
    return [[self alloc]initDispatchBarrierAsync];
}

- (instancetype)initDispatchBarrierAsync {
    if (self = [super init]) {
        [self dispatchBarrier];
    }
    return self;
}

- (void)dispatchBarrier {
    NSLog(@"currentThread --- %@",[NSThread currentThread]);
    NSLog(@"dispatchBarrier --- Begin");
    
    dispatch_queue_t queue = dispatch_queue_create(nil, DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        for (int i=0; i<2; i++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"1---%@",[NSThread currentThread]);
        }
    });
    dispatch_async(queue, ^{
        for (int i=0; i<2; i++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"2---%@",[NSThread currentThread]);
        }
    });
    //栅栏方法
    dispatch_barrier_async(queue, ^{
        for (int i=0; i<2; i++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"3---%@",[NSThread currentThread]);
        }
    });
    
    dispatch_async(queue, ^{
        for (int i=0; i<2; i++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"4---%@",[NSThread currentThread]);
        }
    });
    dispatch_async(queue, ^{
        for (int i=0; i<2; i++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"5---%@",[NSThread currentThread]);
        }
    });
    
    NSLog(@"dispatchBarrier --- end");
}
/**总结：
 1.在执行完栅栏前面的操作之后，才执行栅栏操作，最后再执行栅栏后边的操作。
 */
@end
