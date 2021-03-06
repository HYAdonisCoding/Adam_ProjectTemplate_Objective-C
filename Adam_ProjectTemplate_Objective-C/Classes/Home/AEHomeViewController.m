//
//  AEHomeViewController.m
//  AEObjCWorking_Example
//
//  Created by Adonis_HongYang on 2020/1/7.
//  Copyright © 2020 HYAdonisCoding. All rights reserved.
//

#import "AEHomeViewController.h"

@interface AEHomeViewController ()

@end

@implementation AEHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    
}


#pragma mark -- Lazy Load

- (NSArray *)dataArray {
    if (!_dataArray) {
        _dataArray = @[@"ViewController",
                       @"AEMineViewController",
                       @"AETableViewVC",
                       @"TestVC",
                       @"NULL"
                        ];
    }
    return _dataArray;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:(UITableViewStylePlain)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        UIView *footerView = [[UIView alloc] init];
        footerView.backgroundColor = [UIColor whiteColor];
        _tableView.tableFooterView = footerView;
        
        //隐藏自带的分割线
//        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        // 设置tableView背景色
        _tableView.backgroundColor = [UIColor whiteColor];
        //估算高度
        _tableView.estimatedRowHeight = 150;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.mas_topLayoutGuideBottom);
            make.right.left.mas_equalTo(0);
            make.bottom.mas_equalTo(self.mas_bottomLayoutGuideTop);
        }];
    }
    return _tableView;
}

#pragma mark - UITableViewDelegate, UITableViewDataSource
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
    NSString *string = self.dataArray[indexPath.row];
    if (string.length>14) {
        string = [string substringWithRange:NSMakeRange(2, string.length-12)];
    }
    cell.textLabel.text = string;
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UIViewController *vc = [NSClassFromString(self.dataArray[indexPath.row]) new];
    if (vc) {
        NSString *string = self.dataArray[indexPath.row];
        if ([string hasPrefix:@"AE"] && [string hasSuffix:@"Controller"]) {
            string = [string substringWithRange:NSMakeRange(2, string.length-12)];
        } else if ([string hasSuffix:@"Controller"]) {
            string = [string substringToIndex:string.length-10];
        } else if ([string hasPrefix:@"AE"]) {
            string = [string substringFromIndex:2];
        }
        
        vc.title = string;
        [self.navigationController pushViewController:vc animated:YES];
    } else {
        [self.view showSuccess:@"暂无此类" completeHandler:^(id  _Nonnull data) {
            NSLog(@"%@", @"完成");
        }];
        
//        [self.view showWarningWords:@"暂无此类"];
//        [self.view showWarning];
    }
}
@end
