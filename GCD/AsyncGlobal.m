//
//  AsyncGlobal.m
//  GCD
//
//  Created by WangXueqi on 2018/7/5.
//  Copyright © 2018年 JingBei. All rights reserved.
//

#import "AsyncGlobal.h"

@implementation AsyncGlobal

//8.异步执行 + 全局并发队列(全局并发队列等同于普通并发队列)
+ (instancetype)AsyncAndGloablDispatch {
    return [[self alloc]initAsyncAndGloablDispatch];
}

- (instancetype)initAsyncAndGloablDispatch {
    if (self = [super init]) {
        NSLog(@"currentThread---%@",[NSThread currentThread]);//打印当前线程
        NSLog(@"AsyncAndGlobal---begin");
        
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
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
        NSLog(@"AsyncAndGlobal---end");
    }
    return self;
}
@end
