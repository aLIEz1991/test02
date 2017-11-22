//
//  Const.h
//  azTest2
//
//  Created by DYG_Az on 2017/11/16.
//  Copyright © 2017年 DYG_Az. All rights reserved.
//

#ifndef Const_h
#define Const_h

// NSLocalizedString(key, comment) 本质
// NSlocalizeString 第一个参数是内容,根据第一个参数去对应语言的文件中取对应的字符串，第二个参数将会转化为字符串文件里的注释，可以传nil，也可以传空字符串@""。
#define NSLocalizedString(key, comment) [[NSBundle mainBundle] localizedStringForKey:(key) value:@"" table:nil]

/************************  屏幕尺寸  ***************************/

// 屏幕宽度
#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
// 屏幕高度
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height

// iPhone4
#define isIphone4 (SCREEN_HEIGHT  < 568 ? true : false)
// iPhone 5
#define isIphone5 (SCREEN_HEIGHT  == 568 ? true : false)
// iPhone 6
#define isIphone6 (SCREEN_HEIGHT  == 667 ? true : false)
// iphone 6P
#define isIphone6P (SCREEN_HEIGHT == 736 ? true : false)
// iphone X
#define isIphoneX (SCREEN_HEIGHT == 812 ? true : false)
// 导航条高度
#define NavHeight (isIphoneX ? 88 : 64)
// Tab高度
#define TabHeight (isIphoneX ? 49 + 34 : 49)

// 左右边距
#define Margin 10
// 行高
#define LineHeight 44

// 宽度比例
#define WIDTH_SCALE UIScreen.main.bounds.size.width / 320
// 高度比例
#define HEIGHT_SCALE UIScreen.main.bounds.size.height / 568

//color
#define titleColor [UIColor colorWithRed:0.966 green:0.945 blue:0.819 alpha:1.00]

//Title
#define Cake @"Cake"
#define Bread @"Bread"
#define Chinese @"Chinese"
#define Home @"首页"



#endif /* Const_h */
