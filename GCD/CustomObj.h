//
//  CustomObj.h
//  GCD
//
//  Created by WangXueqi on 2018/7/4.
//  Copyright © 2018年 JingBei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CustomObj : NSObject

/**
 *  1.同步执行 + 并发队列
 */
+ (instancetype)SyncAndConcurrentDispatch;

@end
