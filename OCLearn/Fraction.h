//
//  Fraction.h
//  OCLearn
//
//  Created by LinShan Jiang on 20/9/15.
//  Copyright (c) 2015年 LinShan Jiang. All rights reserved.
//

#ifndef OCLearn_Fraction_h
#define OCLearn_Fraction_h

#import <Foundation/Foundation.h>

@interface Fraction : NSObject
{
    int a;
}

//属性，property
@property (nonatomic,retain) NSString* myName;

- (void) setA:(int)value;

//一个类中不能同时存在两个相同函数名的函数（即使参数不同也不行）
//因为方法是按方法名生成一个SEL。SEL是一个int型的地址
//OC不支持严格方法重载（overload）
//- (void) setA:(NSString*)value;

@end

#endif
