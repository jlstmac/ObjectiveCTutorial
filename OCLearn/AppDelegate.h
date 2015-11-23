//
//  AppDelegate.h
//  OCLearn
//
//  Created by LinShan Jiang on 20/9/15.
//  Copyright (c) 2015年 LinShan Jiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

- (void) property;

- (void) category;

- (void) array;

- (void) traverseArray:(NSArray*)arr;

- (void) stringTest;

- (void) copyTest;

- (void) deapCopy;

- (void) arraySort;

- (void) blockTest;

- (void) runtime;
@end

