//
//  AsyncConcurrent.m
//  GCD
//
//  Created by WangXueqi on 2018/7/5.
//  Copyright © 2018年 JingBei. All rights reserved.
//

#import "AsyncConcurrent.h"

@implementation AsyncConcurrent

//2.异步执行 + 并发队列
+ (instancetype)AsyncAndConcurrentDispatch {
    return [[self alloc]initAsyncAndConcurrentDispatch];
}

- (instancetype)initAsyncAndConcurrentDispatch {
    if (self = [super init]) {
        NSLog(@"currentThread---%@",[NSThread currentThread]);//打印当前线程
        NSLog(@"AsyncAndConcurrent---begin");
        
        dispatch_queue_t queue = dispatch_queue_create(nil, DISPATCH_QUEUE_CONCURRENT);//创建并发队列
        dispatch_async(queue, ^{//异步执行
            for (int i=0; i<2; i++) {
                [NSThread sleepForTimeInterval:2];            //模拟耗时操作
                NSLog(@"1---%@",[NSThread currentThread]);    //打印当前线程
            }
        });
        dispatch_async(queue, ^{//异步执行
            for (int i=0; i<2; i++) {
                [NSThread sleepForTimeInterval:2];            //模拟耗时操作
                NSLog(@"2---%@",[NSThread currentThread]);    //打印当前线程
            }
        });
        dispatch_async(queue, ^{//异步执行
            for (int i=0; i<2; i++) {
                [NSThread sleepForTimeInterval:2];            //模拟耗时操作
                NSLog(@"3---%@",[NSThread currentThread]);    //打印当前线程
            }
        });
        
        NSLog(@"AsyncAndConcurrent---end");
    }
    return self;
}
/**总结：
 1.除了当前线程（主线程），系统又开启了3个线程，并且任务是交替/同时执行的。（异步执行具备开启新线程的能力。且并发队列可开启多个线程，同时执行多个任务）。
 2.所有任务是在打印的AsyncAndConcurrent---begin和AsyncAndConcurrent---end之后才执行的。说明当前线程没有等待，而是直接开启了新线程，在新线程中执行任务（异步执行不做等待，可以继续执行任务）。
 */
@end
