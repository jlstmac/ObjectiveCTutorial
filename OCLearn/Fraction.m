//
//  Fraction.m
//  OCLearn
//
//  Created by LinShan Jiang on 20/9/15.
//  Copyright (c) 2015年 LinShan Jiang. All rights reserved.
//

#include "Fraction.h"

@implementation Fraction
@synthesize myName = name;

- (void)setA:(int)value{
    a = value;
}

- (void)resetA{
    a = 0;
}

- (id)init{
    self = [super init];
    
    if (self) {
        self.myName = @"name";
        [self setMyName:@"haha"];
        NSLog(@"retain count before:%@",name);
    }
    return self;
}

- (void)father{
    NSLog(@"Father class");
}

+ (void)doProtocol2{
    NSLog(@"myProtocol2 function");
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