//
//  SyncSerial.h
//  GCD
//
//  Created by WangXueqi on 2018/7/5.
//  Copyright © 2018年 JingBei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SyncSerial : NSObject

/**
 3.同步执行 + 串行队列
 */
+ (instancetype)SyncAndSerialDispatch;

@end
