//
//  AsyncSerial.h
//  GCD
//
//  Created by WangXueqi on 2018/7/5.
//  Copyright © 2018年 JingBei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AsyncSerial : NSObject

/**
 4.异步执行 + 串行队列
 */
+ (instancetype)AsyncAndSerialDispatch;

@end
