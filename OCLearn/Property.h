//
//  Property.h
//  OCLearn
//
//  Created by LinShan Jiang on 9/11/15.
//  Copyright (c) 2015年 LinShan Jiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Property : NSObject
{
    NSString* tname;
    NSString* cname;
}

@property (nonatomic,retain,getter=getName) NSString* myName;
@property (strong) NSString* herName;

@property (assign) int a;
@property (assign) NSString* aa;

- (void)setName:(NSString*)name;
- (void)setCName:(NSString*)cname;
- (void)setAName:(NSString*)aname;

- (instancetype)initWithName:(NSString*)name;

@end
