//
//  AsyncMain.m
//  GCD
//
//  Created by WangXueqi on 2018/7/5.
//  Copyright © 2018年 JingBei. All rights reserved.
//

#import "AsyncMain.h"

@implementation AsyncMain

//6.异步执行 + 主队列
+ (instancetype)AsyncAndMainDispatch {
    return [[self alloc]initAsyncAndMainDispatch];
}

- (instancetype)initAsyncAndMainDispatch {
    if (self = [super init]) {
        NSLog(@"currentThread---%@",[NSThread currentThread]);//打印当前线程
        NSLog(@"AsyncAndMain---begin");
        
        dispatch_queue_t queue = dispatch_get_main_queue();   //获取主线程
        dispatch_async(queue, ^{
            for (int i=0; i<2; i++) {
                [NSThread sleepForTimeInterval:2];            //模拟耗时线程
                NSLog(@"1---%@",[NSThread currentThread]);    //打印当前线程
            }
        });
        dispatch_async(queue, ^{
            for (int i=0; i<2; i++) {
                [NSThread sleepForTimeInterval:2];            //模拟耗时线程
                NSLog(@"2---%@",[NSThread currentThread]);    //打印当前线程
            }
        });
        dispatch_async(queue, ^{
            for (int i=0; i<2; i++) {
                [NSThread sleepForTimeInterval:2];            //模拟耗时线程
                NSLog(@"3---%@",[NSThread currentThread]);    //打印当前线程
            }
        });
        NSLog(@"AsyncAndMain---end");
    }
    return self;
}
@end
