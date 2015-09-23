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

@end

#endif
