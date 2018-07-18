//
//  SyncMain.m
//  GCD
//
//  Created by WangXueqi on 2018/7/5.
//  Copyright © 2018年 JingBei. All rights reserved.
//

#import "SyncMain.h"

@implementation SyncMain

//5.同步执行 + 主队列（会造成死锁）
+ (instancetype)SyncAndMainDispatch {
    return [[self alloc]initSyncAndMainDispatch];
}

- (instancetype)initSyncAndMainDispatch {
    if (self = [super init]) {
        NSLog(@"currentThread---%@",[NSThread currentThread]);//打印当前线程
        NSLog(@"SyncAndMain---begin");
        
        dispatch_queue_t queue = dispatch_get_main_queue();
        dispatch_sync(queue, ^{
            for (int i=0; i<2; i++) {
                [NSThread sleepForTimeInterval:2];            //模拟耗时操作
                NSLog(@"1---%@",[NSThread currentThread]);    //打印当前线程
            }
        });
        NSLog(@"SyncAndMain---end");
    }
    return self;
}
/**总结：
 1.在主线程中使用同步执行 + 主队列，追加到主线程的任务1、任务2、任务3都不再执行了，而且syncMain---end也没有打印
 2.死锁原因：这是因为我们在主线程中添加同步操作时，同步操作要等主线程的任务执行完成才开始执行，此时同步操作处于等待状态。而主线程任务中含有已经添加的同步操作，而主线程只有等同步操作执行完成才能继续操作，而此时的同步操作处于等待状态，所以主线程会等待同步操作执行完成才继续执行，从而两者相互等待，以至于会造成线程死锁。
 */
@end
