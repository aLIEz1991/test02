//
//  Formulation+CoreDataProperties.m
//  
//
//  Created by DYG_Az on 2017/11/23.
//
//

#import "Formulation+CoreDataProperties.h"

@implementation Formulation (CoreDataProperties)

+ (NSFetchRequest<Formulation *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Formulation"];
}

@dynamic date;
@dynamic remark;
@dynamic proDetail;
@dynamic proId;
@dynamic proImg;
@dynamic proName;
@dynamic proPrice;
@dynamic proSize;
@dynamic proType;

@end
