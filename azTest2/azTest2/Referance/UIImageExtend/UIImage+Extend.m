//
//  UIImage+Extend.m
//  azTest2
//
//  Created by DYG_Az on 2017/11/16.
//  Copyright © 2017年 DYG_Az. All rights reserved.
//

#import "UIImage+Extend.h"

@implementation UIImage (Extend)

#pragma mark -- 图片Base64转码
- (NSString *)base64String {
    
    NSData * dataNew = UIImageJPEGRepresentation(self, 1.0f);
    
    NSString * str = [dataNew base64EncodedStringWithOptions:0];
    
    return str;
    
}

#pragma mark -- 生成颜色图片
+ (UIImage *)getImageWithColor:(UIColor *)color size:(CGSize)size {
    
    if (!color || size.width <= 0 || size.height <= 0) return nil;
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
    
}


@end
