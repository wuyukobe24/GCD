//
//  CustomObj.m
//  GCD
//
//  Created by WangXueqi on 2018/7/4.
//  Copyright © 2018年 JingBei. All rights reserved.
//

#import "CustomObj.h"

@implementation CustomObj

//1.同步执行 + 并发队列
+ (instancetype)SyncAndConcurrentDispatch {
    return[[self alloc]initSyncAndConcurrentDispatch];
}

- (instancetype)initSyncAndConcurrentDispatch {
    if (self = [super init]) {
        NSLog(@"currentThread---%@",[NSThread currentThread]);//打印当前线程
        NSLog(@"SyncAndConcurrent---begin");
        
        NSLog(@"SyncAndConcurrent---end");
    }
    return self;
}

@end
