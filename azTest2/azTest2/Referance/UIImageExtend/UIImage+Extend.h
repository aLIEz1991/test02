//
//  UIImage+Extend.h
//  azTest2
//
//  Created by DYG_Az on 2017/11/16.
//  Copyright © 2017年 DYG_Az. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extend)

// 图片Base64转码
- (NSString *)base64String;
// 生成颜色图片
+ (UIImage *)getImageWithColor:(UIColor *)color size:(CGSize)size;

@end
