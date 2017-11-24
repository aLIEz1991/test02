//
//  FormulationManager.h
//  azTest2
//
//  Created by DYG_Az on 2017/11/24.
//  Copyright © 2017年 DYG_Az. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Formulation+CoreDataClass.h"
//@class Formuation;

@interface FormulationManager : NSObject

// 单例
+ (instancetype) shareCoreDataTools;
// 创建数据库
//增
- (void) insertData : (NSDictionary * )dictionary;
//删
- (void) deleteData : (Formulation * )model;
//改
- (void) updateData : (Formulation * )model;
//查
- (NSArray *) searchData : (NSString * )proType;
@end
