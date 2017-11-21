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



#endif /* Const_h */
