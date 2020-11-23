//
//  TestTableViewCell.h
//  WebViewInCellAdaptive
//
//  Created by OFweek01 on 2020/11/23.
//

#import <UIKit/UIKit.h>
#import "TestModel.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^HeightBlock)(void);

@interface TestTableViewCell : UITableViewCell

@property (nonatomic, copy) HeightBlock heightBlock;

@property (nonatomic, strong) TestModel *model;

@end

NS_ASSUME_NONNULL_END
