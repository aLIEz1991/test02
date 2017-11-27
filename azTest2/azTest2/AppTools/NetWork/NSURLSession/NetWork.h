//
//  NetWork.h
//  azTest2
//
//  Created by DYG_Az on 2017/11/27.
//  Copyright © 2017年 DYG_Az. All rights reserved.
//

#import <Foundation/Foundation.h>

//定义返回请求数据的block类型
typedef void (^SuccessBlock) (id returnValue);
typedef void (^FailureBlock)(NSInteger errorCode);
typedef void (^NetWorkBlock)(BOOL netConnetState);

@interface NetWork : NSObject

//网络状态判断
+ (BOOL) isExistenceNetwork;

//Get
+ (void) dataTaskSendGet:(NSString * )url
              parameters:(id)parameters
                 success:(SuccessBlock)successBlock
                  failed:(FailureBlock)failureBlock;

//Post
+ (void) dataTaskSendPost:(NSString * )url
              parameters:(id)parameters
                 success:(SuccessBlock)successBlock
                  failed:(FailureBlock)failureBlock;

@end
