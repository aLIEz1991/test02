//
//  LocalizationManager.h
//  azTest2
//
//  Created by DYG_Az on 2017/11/16.
//  Copyright © 2017年 DYG_Az. All rights reserved.
//

#import <Foundation/Foundation.h>

// 国际化管理者
@interface LocalizationManager : NSObject

// 获取当前资源文件
+ (NSBundle *)bundle;
// 初始化语言文件
+ (void)initUserLanguage;
// 获取应用当前语言
+ (NSString *)userLanguage;
// 设置当前语言
+ (void)setUserlanguage:(NSString *)language;
// 通过Key获得对应的string
+ (NSString *)getStringByKey:(NSString *)key;

@end
