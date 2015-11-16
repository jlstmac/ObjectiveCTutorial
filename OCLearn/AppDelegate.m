//
//  AppDelegate.m
//  OCLearn
//
//  Created by LinShan Jiang on 20/9/15.
//  Copyright (c) 2015年 LinShan Jiang. All rights reserved.
//

#import "AppDelegate.h"
#import "FractionSub.h"
#import "Fraction.h"
#import "PropertyLearn.h"
#import "Fraction+CategoryLearn.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    FractionSub* sub = [[FractionSub alloc] init];
    [sub setA:100];
    [sub printA];

    Fraction* ft = [[Fraction alloc] init];
    ft.myName = @"newname";
    
    Fraction* ft2 = [[Fraction alloc] initWithValue:2];
    id ft3 = [[Fraction alloc] init];
//    [ft2 noFunc];
//    [ft3 noFunc];
    
    for (int i = 0; i < 10; i++) {
        NSLog(@"%d",i);
    }
    
    //isKindOfClass:检测对象是不是该类或者该类的子类的对象
    //检测方式是坚持该类或者该类的父类的class是否＝＝isa
    bool result1 = [sub isKindOfClass:[Fraction class]];
    NSLog(@"re:%d",result1);
    //这样写，编译时并不会报错，但是运行时却会崩溃
    //因为，Fraction类中并没有定义printA方法
    //编译时并不知道存储在fc中的对象类型就是Fraction,只有在运行时才会去检查fc中的对象类型是Fraction
    /*
    id fc= [[Fraction alloc] init];
    [fc printA];
     */
    
    //isMemberOfClass:检测对象是不是该类的对象
    //检测方式是坚持该类class是否＝＝isa
    bool result2 = [sub isMemberOfClass:[Fraction class]];
    NSLog(@"re:%d",result2);

    //respondsToSelector:检测对象是否有以这个名字命名的方法
    bool result3 = [ft respondsToSelector:@selector(father)];
    //instancesRespondToSelector:检测类是否含有以这个名字命名的方法
    bool result4 = [Fraction instancesRespondToSelector:@selector(son)];

//    [ft father];
    
    //为方法生产一个SEL
    SEL selector = @selector(father);
    //生成father方法的签名
//    NSMethodSignature* signture = [Fraction instanceMethodSignatureForSelector:selector];
    NSMethodSignature* signture = [ft methodSignatureForSelector:selector];
    //生成Invocation
    NSInvocation* inv = [NSInvocation invocationWithMethodSignature:signture];
//    [[ft performSelectorInBackground:<#(SEL)#> withObject:<#(id)#>]
//    [[NSMethodSignature methodSignatureForSelector:@selector()]
    [inv setSelector:selector];
    [inv setTarget:ft];
//    NSTimer* timer = [NSTimer scheduledTimerWithTimeInterval:0.0f invocation:inv repeats:NO];
    NSTimer* timer = [NSTimer timerWithTimeInterval:1.0f invocation:inv repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    [timer fire];
    [timer invalidate];
    
    [FractionSub doProtocol2];
    
    id ftf = [[Fraction alloc] initReturnID];
    //编译器并没有报错，但是运行时会崩溃。因为它是id类型
    //[ftf son];
    //但是这种情况也会报错，因为这个时候编译器把id类型转换成了instancetype类型
//    [[[Fraction alloc] initReturnID] son];
    
    //编译器会报错，因为编译知道[[Fraction alloc] initReturnInstancetype]返回的实例是属于Fraction对象
//    [[[Fraction alloc] initReturnInstancetype] son];
    
    [self property];
    
    [self category];
    
    return YES;
}

- (void)property{
    [[PropertyLearn alloc] initWitTest];
}

- (void)category{
    //需要import进 Fraction+CategoryLearn.h才能正确编译
    [[[Fraction alloc] init] printCategory];
    [[[FractionSub alloc] init] printCategory];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
