//
//  SyncMainResolve.m
//  GCD
//
//  Created by WangXueqi on 2018/7/5.
//  Copyright © 2018年 JingBei. All rights reserved.
//

#import "SyncMainResolve.h"

@implementation SyncMainResolve

//5.同步执行 + 主队列(解决死锁调用方法)
+ (instancetype)SyncAndMainDispatchResolve {
    return [[self alloc]initSyncAndMainDispatchResolve];
}

- (instancetype)initSyncAndMainDispatchResolve {
    if (self = [super init]) {
        NSLog(@"currentThread---%@",[NSThread currentThread]);//打印当前线程
        NSLog(@"SyncAndMain---begin");
        //创建其他线程中调用同步执行 + 主队列
        [NSThread detachNewThreadSelector:@selector(SyncMain) toTarget:self withObject:nil];
    }
    return self;
}

- (void)SyncMain {
    NSLog(@"currentThread 4---%@",[NSThread currentThread]);//打印当前线程
    NSLog(@"SyncAndMain 4---begin");
    
    dispatch_queue_t queue = dispatch_get_main_queue();
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
            NSLog(@"2---%@",[NSThread currentThread]);    //打印当前线程
        }
    });
    NSLog(@"SyncAndMain---end");
}
@end
