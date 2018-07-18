//
//  ViewController.m
//  GCD
//
//  Created by WangXueqi on 2018/7/4.
//  Copyright © 2018年 JingBei. All rights reserved.
//

#import "ViewController.h"
#import "SyncConcurrentObj.h"
#import "AsyncConcurrent.h"
#import "SyncSerial.h"
#import "AsyncSerial.h"
#import "SyncMain.h"
#import "AsyncMain.h"
#import "SyncGlobal.h"
#import "AsyncGlobal.h"
#import "SyncMainResolve.h"
#import "DispatchBarrierAsync.h"
#import "DispatchAfter.h"
#import "DispatchOnce.h"
#import "DispatchApply.h"
#import "DispatchGroupViewController.h"
#import "DispatchSemaphoreViewController.h"

static NSString * const cellID = @"cellID";
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,strong)NSArray * dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"GCD任务和队列";
    [self.view addSubview:self.tableView];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [[UIView alloc]init];
    }
    return _tableView;
}

#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        cell.textLabel.text = self.dataArray[indexPath.row];
        cell.textLabel.textColor = [UIColor blackColor];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger row = indexPath.row;
    if (row == 0) {
        [SyncConcurrentObj SyncAndConcurrentDispatch];
    }else if (row == 1) {
        [AsyncConcurrent AsyncAndConcurrentDispatch];
    }else if (row == 2) {
        [SyncSerial SyncAndSerialDispatch];
    }else if (row == 3) {
        [AsyncSerial AsyncAndSerialDispatch];
    }else if (row == 4) {
        [SyncMain SyncAndMainDispatch];
    }else if (row == 5) {
        [AsyncMain AsyncAndMainDispatch];
    }else if (row == 6) {
        [SyncGlobal SyncAndGlobalDispatch];
    }else if (row == 7) {
        [AsyncGlobal AsyncAndGloablDispatch];
    }else if (row == 8) {
        [SyncMainResolve SyncAndMainDispatchResolve];
    }else if (row == 9) {
        [DispatchBarrierAsync DispatchBarrierAsync];
    }else if (row == 10) {
        [DispatchAfter DispatchAfterManager];
    }else if (row == 11) {
        DispatchOnce * one = [DispatchOnce dispatchOnceManager];
        DispatchOnce * two = [DispatchOnce dispatchOnceManager];
        DispatchOnce * three = [DispatchOnce dispatchManager];
        DispatchOnce * four = [DispatchOnce dispatchManager];
        NSLog(@"one  :%@",one);
        NSLog(@"two  :%@",two);
        NSLog(@"three:%@",three);
        NSLog(@"four :%@",four);
    }else if (row == 12) {
        [DispatchApply DispatchApplyManager];
    }else if (row == 13) {
        DispatchGroupViewController * group = [[DispatchGroupViewController alloc]initWithNibName:NSStringFromClass([DispatchGroupViewController class]) bundle:[NSBundle mainBundle]];
        [self.navigationController pushViewController:group animated:YES];
    }else if (row == 14) {
        DispatchSemaphoreViewController * semaphore = [[DispatchSemaphoreViewController alloc]initWithNibName:NSStringFromClass([DispatchSemaphoreViewController class]) bundle:[NSBundle mainBundle]];
        [self.navigationController pushViewController:semaphore animated:YES];
    }
}

#pragma mark - 初始化数据
- (NSArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSArray arrayWithObjects:@"1.同步执行 + 并发队列",@"2.异步执行 + 并发队列",@"3.同步执行 + 串行队列",@"4.异步执行 + 串行队列",@"5.同步执行 + 主队列",@"6.异步执行 + 主队列",@"7.同步执行 + 全局并发队列",@"8.异步执行 + 全局并发队列",@"5.同步执行 + 主队列（解决死锁）",@"9.GCD栅栏方法:dispatch_barrier_async",@"10.GCD延时执行方法:dispatch_after",@"11.GCD单例:dispatch_once",@"12.GCD快速迭代方法：dispatch_apply",@"13.GCD队列组：dispatch_group",@"14.GCD信号量：dispatch_semaphore", nil];
    }
    return _dataArray;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
