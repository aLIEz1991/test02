//
//  Formulation+CoreDataProperties.h
//  
//
//  Created by DYG_Az on 2017/11/23.
//
//

#import "Formulation+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Formulation (CoreDataProperties)

+ (NSFetchRequest<Formulation *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSDate *date;
@property (nullable, nonatomic, copy) NSString *remark;
@property (nullable, nonatomic, copy) NSString *proDetail;
@property (nonatomic) int64_t proId;
@property (nullable, nonatomic, copy) NSString *proImg;
@property (nullable, nonatomic, copy) NSString *proName;
@property (nonatomic) double proPrice;
@property (nullable, nonatomic, copy) NSString *proSize;
@property (nullable, nonatomic, copy) NSString *proType;

@end

NS_ASSUME_NONNULL_END
