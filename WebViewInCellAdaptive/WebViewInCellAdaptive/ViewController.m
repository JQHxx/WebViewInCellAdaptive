//
//  ViewController.m
//  WebViewInCellAdaptive
//
//  Created by OFweek01 on 2020/11/23.
//

#import "ViewController.h"
#import <Masonry/Masonry.h>
#import "TestTableViewCell.h"
#import "TestModel.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *datas;
@property (nonatomic, strong) NSMutableArray *indexPaths;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    TestModel *model = [self.datas objectAtIndex:indexPath.row % self.datas.count];
    if (model.dataHeight > 0) {
        return model.dataHeight;
    }
    return UITableViewAutomaticDimension;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TestTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TestTableViewCell"];
    if (cell == nil) {
        cell = [[TestTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TestTableViewCell"];
    }
    
    cell.model = [self.datas objectAtIndex:indexPath.row % self.datas.count];
    
    __weak typeof(self) weakSelf = self;
    cell.heightBlock = ^{
        __strong typeof(weakSelf) strongSelf = weakSelf;
        /*  重置tableViewCell.height.
            如果使用reloadData()或者reloadRow()会导致webView重新加载.陷入循环.
            使用beginUpdates只更新frame,并不重新加载
         */
        if ([strongSelf.indexPaths containsObject:@(indexPath.row)]) {
            return;
        }
        [strongSelf.indexPaths addObject:@(indexPath.row)];
        [tableView beginUpdates];
        //[tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
        [tableView endUpdates];
        /*
        [UIView performWithoutAnimation:^{

        }];
         */
    };
    return cell;
}

#pragma mark - Setter & Getter
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [_tableView registerClass:[TestTableViewCell class] forCellReuseIdentifier:@"TestTableViewCell"];
    }
    return _tableView;
}

- (NSMutableArray *)datas {
    if (!_datas) {
        _datas = [NSMutableArray array];
        {
            TestModel *model = [[TestModel alloc]init];
            NSString *text = @"测试";
            model.content = text;
            [_datas addObject:model];
        }
        {
            TestModel *model = [[TestModel alloc]init];
            NSString *text = @"测测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试试";
            model.content = text;
            [_datas addObject:model];
        }
        
        {
            TestModel *model = [[TestModel alloc]init];
            NSString *text = @"测试测测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试试测测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试试测测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试试测测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试试测测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试试测测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试试测测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试试测测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试试测测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试试测测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试试测测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试试测测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试试测测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试试测测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试试";
            model.content = text;
            [_datas addObject:model];
        }
    }
    return _datas;
}

- (NSMutableArray *)indexPaths {
    if (!_indexPaths) {
        _indexPaths = [NSMutableArray array];
    }
    return _indexPaths;
}
@end
