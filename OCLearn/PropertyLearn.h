//
//  PropertyLearn.h
//  OCLearn
//
//  Created by 姜林杉 on 15/11/13.
//  Copyright (c) 2015年 LinShan Jiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PropertyLearn : NSObject
{
    NSString* nasStr;
}

@property (assign) NSString* asStr;
@property (retain,strong) NSString* reStr;
@property (strong,atomic) NSString* atomicStr;
@property (strong,nonatomic) NSString* nonatomicStr;
-(instancetype) initWitTest;

-(void) setStr:(NSString*)str;

@end
