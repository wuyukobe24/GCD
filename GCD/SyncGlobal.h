//
//  SyncGlobal.h
//  GCD
//
//  Created by WangXueqi on 2018/7/5.
//  Copyright © 2018年 JingBei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SyncGlobal : NSObject
/**
 7.同步执行 + 全局并发队列(全局并发队列等同于普通并发队列)
 */
+ (instancetype)SyncAndGlobalDispatch;

@end
