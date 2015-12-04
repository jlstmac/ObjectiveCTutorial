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
//#import "Fraction+CategoryA.h"
//#import "Fraction+CategoryTest.h"
#import "Fraction+CategoryLearn.h"
#import <objc/runtime.h>
extern uintptr_t  _objc_rootRetainCount(id obj);

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
    
    [self array];
    
    [self stringTest];
    
    [self copyTest];
    
    [self deapCopy];
    
    [self arraySort];
    
    [self blockTest];
    
    [self runtime];
    
    [self compile];
    
    [self arcLearn];
    
    [self gcdLearn];
//    _objc_autoreleasePoolPrint();
    
    
    return YES;
}

- (void)property{
    [[PropertyLearn alloc] initWitTest];
}

- (void)category{
    //需要import进 Fraction+CategoryLearn.h才能正确编译
    NSLog(@"category start func:%@",NSStringFromSelector(_cmd));
    [[[Fraction alloc] init] printCategory];
    [[[FractionSub alloc] init] printCategory];

}

- (void)array{
    NSLog(@"array start:%@",NSStringFromSelector(_cmd));
    //NSArray是不可变的，不能插入或者删除
    //NSMutableArray是可变的，可以插入或者删除
    NSArray* arr = [[NSArray alloc] initWithObjects:@"Hellow",@"world",@"!", nil];
    [self traverseArray:arr];
    
    NSMutableArray* mutarr = [[NSMutableArray alloc] initWithObjects:@"What", @"a", @"fucking", @"day", nil];

    [mutarr insertObject:@"!" atIndex:4];
    [mutarr removeObject:@"day" inRange:NSMakeRange(0, 3)];
    for (int i = 0; i < [mutarr count]; i++) {
        NSLog(@"arr:%@",[mutarr objectAtIndex:i]);
    }
    
}

- (void)traverseArray:(NSArray *)arr{
    NSLog(@"current func:%@",NSStringFromSelector(_cmd));
    NSEnumerator* enumerator = [arr objectEnumerator];
    id obj;
    while (obj = [enumerator nextObject]) {
        NSLog(@"arrObject:%@",obj);
    }
}

- (void)stringTest{
    NSLog(@"current func:%@",NSStringFromSelector(_cmd));

    unichar data[5] = {'a','b','c','d','e'};
    NSString* str = [[NSString alloc] initWithCharacters:data length:sizeof(data)/sizeof(data[0])];
    NSLog(@"str:%@",str);
    
    char* hello = "hello world!";
    NSString* str2 = [[NSString alloc] initWithUTF8String:hello];
    NSLog(@"str2:%@",str2);
    
    NSString* sub = [str2 substringWithRange:NSMakeRange(2, 3)];
    NSLog(@"sub:%@",sub);
    
    char* buffer;
    [str2 getCharacters:buffer range:NSMakeRange(2, 3)];
    NSLog(@"buffer:%s",buffer);
    

    NSString* str3 = [str2 stringByAppendingString:str];
    NSLog(@"str3:%@",str3);

    NSRange range = [str3 rangeOfString:@"world"];
    NSLog(@"range:%ld,range:%ld",range.location,range.length);
    
    //全部大写
    NSString* upStr = [str3 uppercaseString];
    NSLog(@"upStr:%@",upStr);
    
    //全部小写
    NSString* lowStr = [str3 lowercaseString];
    NSLog(@"lowStr:%@",lowStr);

    //每个单词的首字母大写
    NSString* cpStr = [str3 capitalizedString];
    NSLog(@"cpStr:%@",cpStr);
    

}

- (void) copyTest{
    //使用copy后都变成了不可变的
    //使用mutableCopy后都变成了可变的
    
    NSLog(@"current func:%@",NSStringFromSelector(_cmd));
    NSString* str = @"unmutable string";
    NSMutableString* mutStr = [[NSMutableString alloc] initWithString:@"mutable string"];
    
    NSMutableString* strmc = [str mutableCopy];
    [ strmc appendString:@"append"];
    //运行到这里会报错，因为copy后变成了不可变的，不能appendString
//    [[mutStr copy] appendString:@"append"];
    NSLog(@"strmc:%@",strmc);
    NSLog(@"mutStr:%@",mutStr);
    
    NSString* strc = [mutStr copy];
    NSLog(@"strc:%@",strc);
}

- (void) deapCopy{
    NSString* str = @"imutable";
    NSMutableArray* mustr = [[NSMutableString alloc] initWithString:@"mutable"];
    
    //strc和str的地址是一样的，浅拷贝
    //除了对不可变的变量进行不可变的拷贝（copy）是浅拷贝，其它都是深拷贝
    NSString* strc = [str copy];
}

NSInteger compareFunc(id obj1, id obj2, void* context){
    int v1 = [obj1 intValue];
    int v2 = [obj2 intValue];
    
    if(v1 < v2){
        return NSOrderedAscending;
    }else if (v1 > v2){
        return NSOrderedDescending;
    }else{
        return NSOrderedSame;
    }
}


- (void) arraySort{
    NSArray* arr = [[NSArray alloc] initWithObjects:
                    [NSNumber numberWithInt:2],
                    [NSNumber numberWithInt:1],
                    [NSNumber numberWithInt:3],
                    [NSNumber numberWithInt:0],
                    nil];
    NSArray* sortedArr = [arr sortedArrayUsingFunction:compareFunc context:nil];
    
    NSArray* sortedArr2 =  [arr sortedArrayUsingSelector:@selector(compare:)];
    
    NSLog(@"arrnum: \n%@\n",sortedArr);
    NSLog(@"arrnum: \n%@\n",sortedArr2);
    
    for(id obj in arr)
    {
        NSLog(@"num:%@",obj);
    }
}

int global_value = 7;
- (void)blockTest{
    NSLog(@"current func:%@",NSStringFromSelector(_cmd));
    NSInteger value= 4;
    __block NSInteger blockValue = 10;
    static int static_value = 6;
    
    void (^blocktest)(void) = ^{
        //会报错，value在block内视为const
        //value = 6;
        NSLog(@"int:%ld",(long)value);
        
        //不会报错，因为有__block前缀,block块内可以改变值
        if(blockValue == 10){
            blockValue = 11;
        }
        
        //对于全局变量，或者静态变量或者全局静态变量，block里是可以正常使用的
        global_value += 1;
        static_value += 1;
        
        NSLog(@"block int:%ld",(long)blockValue);
    };
    value = 5;
    
    //invoke this block:blocktest
    //block中捕获的外界变量可以看作是const的，因此输出的是4而不是5。
    blocktest();
    
    blockValue = 12;
    blocktest();
}

- (void)runtime{
    NSString* myStr = @"string";
    const char* key = "key";
    NSArray* arr = [[NSArray alloc] initWithObjects:@"hello", @"world", @"!", nil
                    ];
    
    //设置关联变量
    objc_setAssociatedObject(arr,key,myStr,OBJC_ASSOCIATION_RETAIN);
    
    //获取关联变量
    NSLog(@"my associatedobjct:%@",objc_getAssociatedObject(arr, key));
    
    //取消该关联变量，置空
    objc_setAssociatedObject(arr, key, nil, OBJC_ASSOCIATION_RETAIN);
    
    //取消全部关联变量
    objc_removeAssociatedObjects(arr);
    
}

- (void)compile{
    //Fraction* fc = [[Fraction alloc] init];
    //[fc setA:10];
    
    //编译器把oc代码转换成c语言后：
    Fraction* fc = objc_msgSend(objc_getClass("Fraction"),sel_registerName("alloc"));
    fc = objc_msgSend(fc,sel_registerName("init"));
    
    objc_msgSend(fc,sel_registerName("setA:"),10);
}

- (void)arcLearn{
    id __strong fc = [[Fraction alloc] init];
    NSLog(@"retain count:%lu",_objc_rootRetainCount(fc));
    
//    extern void _objc_autoreleasePoolPrint();
//    _objc_autoreleasePoolPrint();
    @autoreleasepool {
        id __autoreleasing obj = fc;
        NSLog(@"retain count:%lu",_objc_rootRetainCount(fc));

    }
    NSLog(@"retain count:%lu",_objc_rootRetainCount(fc));

}

- (void)gcdLearn{
    //create a Serial Dispatch Queue
    dispatch_queue_t mySerialDispatchQueue = dispatch_queue_create("com.oclearn.gcd.mySerialDiapatchQueue", NULL);
    
    //create a Concurrent Dispatch Queue
    dispatch_queue_t myConcurrentDispatchQueue = dispatch_queue_create("com.oclearn.gcd.myConcurrentDispatchQueue", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(mySerialDispatchQueue, ^{
        NSLog(@"mySerialDispatchQueue_block_1");
    });
    
    dispatch_async(mySerialDispatchQueue, ^{
        NSLog(@"mySerialDispatchQueue_block_2");
    });
    
    dispatch_async(myConcurrentDispatchQueue, ^{
        NSLog(@"myConcurrentQueue_block_1");
        NSLog(@"myConcurrentQueue_block_1_end");

    });
    
    dispatch_async(mySerialDispatchQueue, ^{
        NSLog(@"myConcurrentQueue_block_2");
        NSLog(@"myConcurrentQueue_block_2_end");

    });
    
    dispatch_async(myConcurrentDispatchQueue, ^{
        NSLog(@"myConcurrentQueue_block_3");
        NSLog(@"myConcurrentQueue_block_3_end");

    });
    
    dispatch_async(mySerialDispatchQueue, ^{
        NSLog(@"myConcurrentQueue_block_4");
        NSLog(@"myConcurrentQueue_block_4_end");

    });

    //ios6.0及以后GCB的对象也被纳入ARC管理范围了，所以不需要手动（dispatch_retain和dispatch_release）
//    dispatch_release(mySerialDispatchQueue);
//    dispatch_release(myConcurrentDispatchQueue);
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
