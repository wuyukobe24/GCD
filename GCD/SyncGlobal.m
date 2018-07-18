//
//  SyncGlobal.m
//  GCD
//
//  Created by WangXueqi on 2018/7/5.
//  Copyright © 2018年 JingBei. All rights reserved.
//

#import "SyncGlobal.h"

@implementation SyncGlobal

//7.同步执行 + 全局并发队列(全局并发队列等同于普通并发队列)
+ (instancetype)SyncAndGlobalDispatch {
    return [[self alloc]initSyncAndGlobalDispatch];
}

- (instancetype)initSyncAndGlobalDispatch {
    if (self = [super init]) {
        NSLog(@"currentThread---%@",[NSThread currentThread]);//打印当前线程
        NSLog(@"SyncAndGlobal---begin");
        
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        dispatch_sync(queue, ^{
            for (int i=0; i<2; i++) {
                [NSThread sleepForTimeInterval:2];            //模拟耗时操作
                NSLog(@"1---%@",[NSThread currentThread]);    //打印当前线程
            }
        });
        dispatch_sync(queue, ^{
            for (int i=0; i<2; i++) {
                [NSThread sleepForTimeInterval:2];            //模拟耗时操作
                NSLog(@"2---%@",[NSThread currentThread]);    //打印当前线程
            }
        });
        dispatch_sync(queue, ^{
            for (int i=0; i<2; i++) {
                [NSThread sleepForTimeInterval:2];            //模拟耗时操作
                NSLog(@"3---%@",[NSThread currentThread]);    //打印当前线程
            }
        });
        NSLog(@"SyncAndGlobal---end");
    }
    return self;
}
@end
