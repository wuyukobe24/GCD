//
//  SyncConcurrentObj.m
//  GCD
//
//  Created by WangXueqi on 2018/7/5.
//  Copyright © 2018年 JingBei. All rights reserved.
//

#import "SyncConcurrentObj.h"

@implementation SyncConcurrentObj


//1.同步执行 + 并发队列
+ (instancetype)SyncAndConcurrentDispatch {
    return[[self alloc]initSyncAndConcurrentDispatch];
}

- (instancetype)initSyncAndConcurrentDispatch {
    if (self = [super init]) {
        NSLog(@"currentThread---%@",[NSThread currentThread]);//打印当前线程
        NSLog(@"SyncAndConcurrent---begin");
        
        dispatch_queue_t queue = dispatch_queue_create(nil, DISPATCH_QUEUE_CONCURRENT);//创建并发队列
        dispatch_sync(queue, ^{//同步执行
            for (int i=0; i<2; i++) {
                [NSThread sleepForTimeInterval:2];            //模拟耗时操作
                NSLog(@"1---%@",[NSThread currentThread]);    //打印当前线程
            }
        });
        dispatch_sync(queue, ^{//同步执行
            for (int i=0; i<2; i++) {
                [NSThread sleepForTimeInterval:2];            //模拟耗时操作
                NSLog(@"2---%@",[NSThread currentThread]);    //打印当前线程
            }
        });
        dispatch_sync(queue, ^{//同步执行
            for (int i=0; i<2; i++) {
                [NSThread sleepForTimeInterval:2];            //模拟耗时操作
                NSLog(@"3---%@",[NSThread currentThread]);    //打印当前线程
            }
        });
        NSLog(@"SyncAndConcurrent---end");
    }
    return self;
}

/**总结：
 1.所有任务都是在当前线程（主线程）中执行的，没有开启新的线程（同步执行不具备开启新线程的能力）。
 2.所有任务都在打印的SyncAndConcurrent---begin和SyncAndConcurrent---end之间执行的（同步任务需要等待队列的任务执行结束）。
 3.任务按顺序执行的。按顺序执行的原因：虽然并发队列可以开启多个线程，并且同时执行多个任务。但是因为同步任务不具备开启新线程的能力，因此只有当前线程这一个线程，所以也就不存在并发。而且当前线程只有等待当前队列中正在执行的任务执行完毕之后，才能继续接着执行下面的操作（同步任务需要等待队列的任务执行结束）。所以任务只能一个接一个按顺序执行，不能同时被执行。
 */

@end
