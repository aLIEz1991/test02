//
//  NetWork.m
//  azTest2
//
//  Created by DYG_Az on 2017/11/27.
//  Copyright © 2017年 DYG_Az. All rights reserved.
//

#import "NetWork.h"

@implementation NetWork

#pragma mark -- 单例模式
+(instancetype) shareTools {
    
    static NetWork * network = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        network = [[NetWork alloc] init];
        
    });
 
    return network;
    
}

#pragma mark -- 网络连接判断
+ (BOOL) isExistenceNetwork {
    
    BOOL isExistenceNetwork;
    Reachability * reachability = [Reachability reachabilityWithHostName:@"www.baidu.com"];
    
    switch ([reachability currentReachabilityStatus]) {
            
        case NotReachable:
            
            isExistenceNetwork = FALSE;
            
            break;
       
        case ReachableViaWWAN:
            
            isExistenceNetwork = TRUE;
            
            break;
            
        case ReachableViaWiFi:
            
            isExistenceNetwork = TRUE;
            
            break;

    }
    
    return isExistenceNetwork;
    
}

#pragma mark -- Get 请求
- (void) dataTaskSendGet:(NSString * )url
              parameters:(id)parameters
                 success:(SuccessBlock)successBlock
                  failed:(FailureBlock)failureBlock {
    
    //网络判断
    if ([NetWork isExistenceNetwork]) {
        
        //请求处理
        
    } else {
        
        //网络异常
        
    }
    
}

#pragma mark -- Post 请求
- (void) dataTaskSendPost:(NSString * )url
               parameters:(id)parameters
                  success:(SuccessBlock)successBlock
                   failed:(FailureBlock)failureBlock {

    //网络判断
    if ([NetWork isExistenceNetwork]) {
        
        //请求处理
        NSURL *nsurl = [NSURL URLWithString:url];
        NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:nsurl];
        [request setHTTPBody:[NSJSONSerialization dataWithJSONObject:parameters options:NSJSONWritingPrettyPrinted error:nil]];
        [request setHTTPMethod:@"POST"];
        
        NSURLSession * session = [NSURLSession sharedSession];
        NSURLSessionDataTask * dataTask = [session dataTaskWithURL:request completionHandler:^(NSData * data, NSURLResponse * response, NSError * error) {
            
            if (error) {
                
                //处理异常，考虑Http请求
                failureBlock(error);
                
            } else {
                
                //转成字典类型
                NSDictionary * dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                successBlock(dictionary);
            }
            
        }];
        [dataTask resume];
        
    } else {
        
        //网络异常
        
    }
    
}



@end
