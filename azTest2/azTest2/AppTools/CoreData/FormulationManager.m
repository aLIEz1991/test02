//
//  FormulationManager.m
//  azTest2
//
//  Created by DYG_Az on 2017/11/24.
//  Copyright © 2017年 DYG_Az. All rights reserved.
//

#import "FormulationManager.h"
#import "Formulation+CoreDataClass.h"

@implementation FormulationManager {
    
    //托管对象上下文
    NSManagedObjectContext * _managerObjectContext;
    
}


//单例
+ (instancetype) shareCoreDataTools {
    
    static FormulationManager * manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        if (nil == manager) {
            manager = [[FormulationManager alloc] init];
        }

    });
    return  manager;
}

//初始化
- (id) init {
    if (self == [super init]) {
        [self creatFormulateCoreData];
    }
    return self;
}

#pragma mark --  创建数据库
- (void) creatFormulateCoreData {
    
    // 1  创建模型对象
    // 获取模型路径
    NSURL * modelURL = [[NSBundle mainBundle] URLForResource:@"azIMSData" withExtension:@"momd"];
    //根据模型文件创建模型对象
    NSManagedObjectModel * model = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    
    // 2 创建持久化存储助理：数据库
    // 利用模型对象创建助理对象
    NSPersistentStoreCoordinator * store = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];
    
    //数据库名称和路径
    NSString * docStr = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString * sqlPath = [docStr stringByAppendingPathComponent:@"FormulationCoreData.sqlite"];
    NSLog(@"数据库路径：%@", sqlPath);
    NSURL * sqlURL = [NSURL fileURLWithPath:sqlPath];
    
    NSError * error = nil;
    //设置数据库相关信息 添加一个持久化存储库并设置类型和路径，NSSQLiteStoreType：SQLite作为存储库
    [store addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:sqlURL options:nil error:&error];
    
    if (error) {
        
        NSLog(@"add SQL Fail result : %@", error);
        
    } else {
        
        NSLog(@"add SQL Success");
        
    }
    
    // 3 创建上下文 保存信息 操作数据库
    NSManagedObjectContext * context = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    
    //关联持久化助理
    context.persistentStoreCoordinator = store;
    _managerObjectContext = context;
    
}

#pragma mark -- sql增
- (void) insertData : (NSDictionary * )dictionary {
    
    Formulation * formulation = [NSEntityDescription insertNewObjectForEntityForName:@"Formulation" inManagedObjectContext:_managerObjectContext];
    
    [formulation setProName:dictionary[@""]];
    [formulation setProDetail:dictionary[@""]];
    [formulation setProSize:dictionary[@""]];
    [formulation setProType:dictionary[@""]];
    [formulation setProPrice:[dictionary[@""] doubleValue]];
    
    NSError * error = nil;
    if ([_managerObjectContext save:&error]) {
        
//        UIAlertView * alertV = [[UIAlertView alloc] initWithTitle:nil message:@"Success" delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
//        [alertV show];
        NSLog(@"insert success!");
        
    } else {
        
        NSLog(@"insert fail!");
        
    }
    
}

#pragma mark -- sql删
- (void) deleteData : (Formulation * )model {
    
    [_managerObjectContext deleteObject:(NSManagedObject *)model];
    if ([_managerObjectContext save:nil]) {
        
        NSLog(@"delete success!");
        
    } else {
        
        NSLog(@"delete fail!");
        
    }
    
}

#pragma mark -- sql改
- (void) updateData : (Formulation * )model {
    
    // 创建查询请求
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"EntryEntity"];
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"id = %@", model.proId];
    request.predicate = pre;
    
    // 发送请求
    NSArray * resultArr = [_managerObjectContext executeFetchRequest:request error:nil];
    for (Formulation * fomulation in resultArr) {
        
        fomulation.proDetail = model.proDetail;
        
    }
    
    // save
    NSError * error = nil;
    if ([_managerObjectContext save:&error]) {
        
        NSLog(@"update success!");
        
    } else {
        
        NSLog(@"update fail!");
        
    }
    
}

#pragma mark -- sql查
- (NSArray *) searchData : (NSString *)proType {
    
    /* 谓词的条件指令
     1.比较运算符 > 、< 、== 、>= 、<= 、!=
     例：@"number >= 99"
     
     2.范围运算符：IN 、BETWEEN
     例：@"number BETWEEN {1,5}"
     @"address IN {'shanghai','nanjing'}"
     
     3.字符串本身:SELF
     例：@"SELF == 'APPLE'"
     
     4.字符串相关：BEGINSWITH、ENDSWITH、CONTAINS
     例：  @"name CONTAIN[cd] 'ang'"  //包含某个字符串
     @"name BEGINSWITH[c] 'sh'"    //以某个字符串开头
     @"name ENDSWITH[d] 'ang'"    //以某个字符串结束
     
     5.通配符：LIKE
     例：@"name LIKE[cd] '*er*'"   // *代表通配符,Like也接受[cd].
     @"name LIKE[cd] '???er*'"
     
     *注*: 星号 "*" : 代表0个或多个字符
     问号 "?" : 代表一个字符
     
     6.正则表达式：MATCHES
     例：NSString *regex = @"^A.+e$"; //以A开头，e结尾
     @"name MATCHES %@",regex
     
     注:[c]*不区分大小写 , [d]不区分发音符号即没有重音符号, [cd]既不区分大小写，也不区分发音符号。
     
     7. 合计操作
     ANY，SOME：指定下列表达式中的任意元素。比如，ANY children.age < 18。
     ALL：指定下列表达式中的所有元素。比如，ALL children.age < 18。
     NONE：指定下列表达式中没有的元素。比如，NONE children.age < 18。它在逻辑上等于NOT (ANY ...)。
     IN：等于SQL的IN操作，左边的表达必须出现在右边指定的集合中。比如，name IN { 'Ben', 'Melissa', 'Nick' }。
     
     提示:
     1. 谓词中的匹配指令关键字通常使用大写字母
     2. 谓词中可以使用格式字符串
     3. 如果通过对象的key
     path指定匹配条件，需要使用%K
     
     */
    
    NSFetchRequest * request = [NSFetchRequest fetchRequestWithEntityName:@"Formulation"];
    
    //查询条件
    NSPredicate * pre = [NSPredicate predicateWithFormat:@"proType = %@",proType];
    request.predicate = pre;
    
    //发送请求 返回结果
    NSArray * resultArr = [_managerObjectContext executeFetchRequest:request error:nil];
    return resultArr;
    
    
}

#pragma mark -- 根据Id查数据 (类型？)
- (NSArray *)searchDataWithId:(NSInteger *)proId {
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"EntryEntity"];
    
    //查询条件
    NSPredicate * pre = [NSPredicate predicateWithFormat:@"proId = %@", proId];
    request.predicate = pre;
    
    //发送查询请求,并返回结果
    NSArray * resultArr = [_managerObjectContext executeFetchRequest:request error:nil];
    return resultArr;
}

@end
