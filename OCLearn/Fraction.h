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

@protocol myProtocol

- (void)doProtocl;

@end

@protocol myProtocol2

+ (void)doProtocol2;

@end
//Objective-c是单继承，但是可以实现多个协议
@interface Fraction : NSObject <myProtocol,myProtocol2>
{
    int a;

    @private
    int privateVar;
    
    @public
    int publicVar;
    
    @protected
    int protectedVar;
    //OC中也有@private,@public,@protected，但是只能用在@interface里面，也就是说只能用来修饰变量，不能修饰方法。
//@private
//    - (void) say;
}

//属性，property
@property (nonatomic,retain) NSString* myName;

- (void) setA:(int)value;

- (void) father;

//实现protocol（协议）里的方法
- (void)doProtocl;

+ (void)doProtocol2;

//一个类中不能同时存在两个相同函数名的函数（即使参数不同也不行）
//因为方法是按方法名生成一个SEL。SEL是一个int型的地址
//OC不支持函数重载
//- (void) setA:(NSString*)value;

@end

#endif
