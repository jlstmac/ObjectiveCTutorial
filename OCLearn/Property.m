//
//  Property.m
//  OCLearn
//
//  Created by LinShan Jiang on 9/11/15.
//  Copyright (c) 2015年 LinShan Jiang. All rights reserved.
//

#import "Property.h"

@implementation Property

- (instancetype)initWithName:(NSString*)name{
    self = [super init];
    if (self) {
        [self setName:name];
//        NSLog(@"name refenrence:%lu",(unsigned long)[[self getName] retainCount]);
    }
    return self;
}

//retain
- (void)setName:(NSString *)name
{
    if (tname != name) {
        [tname release];
        tname = [name retain];
    }
}

//copy
- (void)setCName:(NSString *)cname
{
    if (tname != cname) {
        tname = [cname copy];
    }
}

//assign
- (void)setAName:(NSString *)aname
{
    if (tname != aname) {
        tname = aname;
    }
}

@end
