//
//  FractionSub.m
//  OCLearn
//
//  Created by LinShan Jiang on 22/9/15.
//  Copyright (c) 2015年 LinShan Jiang. All rights reserved.
//

#import "FractionSub.h"

@implementation FractionSub
- (void)printA{
    NSLog(@"a = %d",a);
}

//重写了父类的setA方法
- (void)setA:(int)value{    
    a = value >= 100 ? 2 : value;
}

- (void)son{
    NSLog(@"Son class");
}

- (id)initReturnID{
    self = [super init];
    return self;
}

- (instancetype)initReturnInstancetype{
    self = [super init];
    return self;
}

@end
