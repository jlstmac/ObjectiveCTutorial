//
//  PropertyLearn.m
//  OCLearn
//
//  Created by 姜林杉 on 15/11/13.
//  Copyright (c) 2015年 LinShan Jiang. All rights reserved.
//

#import "PropertyLearn.h"

@implementation PropertyLearn

-(instancetype)initWitTest{
    self = [super init];
    if (self) {
        nasStr = [NSString stringWithUTF8String:"haha"];
        NSLog(@"nasStr:%@",nasStr);
        self.asStr = nasStr;
        NSLog(@"asStr:%@",self.asStr);
        nasStr = [NSString stringWithUTF8String:"hehe"];
//        NSLog(@"asStr:%@",self.asStr);
        NSLog(@"nasStr:%@",nasStr);
        

    }
    return self;
}

//atomic的实现
-(void)setStr:(NSString *)str{
    @synchronized(self){
        if (nasStr != str) {
            nasStr = str;
        }
    }
    @autoreleasepool {
        id __autoreleasing it = [[NSObject alloc] init];
    }
}

@end
