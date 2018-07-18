//
//  DispatchOnce.m
//  GCD
//
//  Created by WangXueqi on 2018/7/6.
//  Copyright © 2018年 JingBei. All rights reserved.
//

#import "DispatchOnce.h"

static DispatchOnce * _onceManager;
@implementation DispatchOnce

//单例
+ (instancetype)dispatchOnceManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _onceManager = [[DispatchOnce alloc]init];
    });
    return _onceManager;
}

+ (instancetype)dispatchManager {
    _onceManager = [[DispatchOnce alloc]init];
    return _onceManager;
}

/**
 1.使用dispatch_once 函数能保证某段代码在程序运行过程中只被执行1次，并且即使在多线程的环境下，dispatch_once也可以保证线程安全。
 */
@end
