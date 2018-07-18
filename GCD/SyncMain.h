//
//  SyncMain.h
//  GCD
//
//  Created by WangXueqi on 2018/7/5.
//  Copyright © 2018年 JingBei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SyncMain : NSObject

/**
 5.同步执行 + 主队列
 */
+ (instancetype)SyncAndMainDispatch;

@end
