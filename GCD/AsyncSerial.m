//
//  AsyncSerial.m
//  GCD
//
//  Created by WangXueqi on 2018/7/5.
//  Copyright © 2018年 JingBei. All rights reserved.
//

#import "AsyncSerial.h"

@implementation AsyncSerial

//4.异步执行 + 串行队列
+ (instancetype)AsyncAndSerialDispatch {
    return [[self alloc]initAsyncAndSerialDispatch];
}

- (instancetype)initAsyncAndSerialDispatch {
    if (self = [super init]) {
        NSLog(@"currentThread---%@",[NSThread currentThread]);//打印当前线程
        NSLog(@"AsyncAndSerial---begin");
        
        dispatch_queue_t queue = dispatch_queue_create(nil, DISPATCH_QUEUE_SERIAL);//创建串行队列
        dispatch_async(queue, ^{
            for (int i=0; i<2; i++) {
                [NSThread sleepForTimeInterval:2];            //模拟耗时操作
                NSLog(@"1---%@",[NSThread currentThread]);    //打印当前线程
            }
        });
        dispatch_async(queue, ^{
            for (int i=0; i<2; i++) {
                [NSThread sleepForTimeInterval:2];            //模拟耗时操作
                NSLog(@"2---%@",[NSThread currentThread]);    //打印当前线程
            }
        });
        dispatch_async(queue, ^{
            for (int i=0; i<2; i++) {
                [NSThread sleepForTimeInterval:2];            //模拟耗时操作
                NSLog(@"3---%@",[NSThread currentThread]);    //打印当前线程
            }
        });
        NSLog(@"AsyncAndSerial---end");
    }
    return self;
}
/**总结：
 1.开启了一条新线程（异步执行具备开启新线程的能力，串行队列只开启一个线程）。
 2.所有任务是在打印的AsyncAndSerial---begin和AsyncAndSerial---end之后才开始执行的（异步执行不会做任何等待，可以继续执行任务）。
 3.任务是按顺序执行的（串行队列每次只有一个任务被执行，任务一个接一个按顺序执行）。
 */
@end
