//
//  TestModel.h
//  WebViewInCellAdaptive
//
//  Created by OFweek01 on 2020/11/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TestModel : NSObject

@property (nonatomic, copy) NSString *content;
@property (nonatomic, assign) BOOL isNeedUpdate;
@property (nonatomic, assign) double dataHeight;

@end

NS_ASSUME_NONNULL_END
