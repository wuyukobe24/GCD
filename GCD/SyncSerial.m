//
//  SyncSerial.m
//  GCD
//
//  Created by WangXueqi on 2018/7/5.
//  Copyright © 2018年 JingBei. All rights reserved.
//

#import "SyncSerial.h"

@implementation SyncSerial

//3.同步执行 + 串行队列
+ (instancetype)SyncAndSerialDispatch {
    return [[self alloc]initSyncAndSerialDispatch];
}

- (instancetype)initSyncAndSerialDispatch {
    if (self = [super init]) {
        NSLog(@"currentThread---%@",[NSThread currentThread]);//打印当前线程
        NSLog(@"SyncAndSerial---begin");
        
        dispatch_queue_t queue = dispatch_queue_create(nil, DISPATCH_QUEUE_SERIAL);//创建串行队列
        dispatch_sync(queue, ^{
            for (int i=0; i<2; i++) {
                [NSThread sleepForTimeInterval:2];           //模拟耗时操作
                NSLog(@"1---%@",[NSThread currentThread]);   //打印当前线程
            }
        });
        dispatch_sync(queue, ^{
            for (int i=0; i<2; i++) {
                [NSThread sleepForTimeInterval:2];           //模拟耗时操作
                NSLog(@"2---%@",[NSThread currentThread]);   //打印当前线程
            }
        });
        dispatch_sync(queue, ^{
            for (int i=0; i<2; i++) {
                [NSThread sleepForTimeInterval:2];           //模拟耗时操作
                NSLog(@"3---%@",[NSThread currentThread]);   //打印当前线程
            }
        });
        NSLog(@"SyncAndSerial---end");
    }
    return self;
}
/**总结：
 1.所有任务都是在当前线程（主线程）中执行的，并没有开启新的线程（同步执行不具备开启新线程的能力）。
 2.所有任务都在打印的SyncAndSerial---begin和SyncAndSerial---end之间执行（同步任务需要等待队列的任务执行结束）。
 3.任务是按顺序执行的（串行队列每次只有一个任务被执行，任务一个接一个按顺序执行）。
 */
@end
