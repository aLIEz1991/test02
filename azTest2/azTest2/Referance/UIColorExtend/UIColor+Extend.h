//
//  UIColor+Extend.h
//  azTest2
//
//  Created by DYG_Az on 2017/11/16.
//  Copyright © 2017年 DYG_Az. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Extend)

// 颜色转换 iOS中十六进制的颜色转换为UIColor
+ (UIColor *)colorWithHexString:(NSString *)color;

@end
