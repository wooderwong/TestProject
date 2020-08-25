//
//  LGUncaughtExceptionHandler.m
//  TestProject
//
//  Created by BDKid on 2020/8/19.
//  Copyright © 2020 BDKid. All rights reserved.
//

#import "LGUncaughtExceptionHandler.h"
#import <objc/message.h>

@interface LGUncaughtExceptionHandler()
 

@end
static LGUncaughtExceptionHandler *selfClass =nil;

@implementation LGUncaughtExceptionHandler
+ (BOOL)resolveClassMethod:(SEL)sel{
    return YES;
}

+ (BOOL)resolveInstanceMethod:(SEL)sel{
    return YES;
}

- (id)forwardingTargetForSelector:(SEL)aSelector{
    

    return self;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation{
    
}

- (void)addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context{
    
}

- (void)removeObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath{
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    
}


+(void)installUncaughtExceptionHandler{
    
    NSSetUncaughtExceptionHandler(&LGExceptionHandler);
    NSGetUncaughtExceptionHandler();
}
-(instancetype)init{
    if (self = [super init]) {
//        [self test];
        selfClass = self;
        
        
    }
    return self;
}

void LGExceptionHandler(NSException *exception){
    NSLog(@"%s", __func__);
      
    /**
     *  获取异常崩溃信息
     */
    NSArray *callStack = [exception callStackSymbols];
    NSLog(@"callStackcallStack = %@",callStack);
    NSString *reason = [exception reason];
    NSString *name = [exception name];
    NSString *content = [NSString stringWithFormat:@"异常错误报告开始：\nname:%@\nreason:\n%@\ncallStackSymbols:\n%@结束",name,reason,[callStack componentsJoinedByString:@"\n"]];
    /**
     *  把异常崩溃信息发送至开发者邮件
     */
    NSMutableString *mailUrl = [NSMutableString string];
    [mailUrl appendString:@"mailto:417362459@qq.com"];
    [mailUrl appendString:@"?subject=程序异常崩溃，请配合发送异常报告，谢谢合作！"];
    [mailUrl appendFormat:@"&body=%@", content];
    NSLog(@"mailUrl = %@",mailUrl);
    // 打开地址
    //     NSString *mailPath = [mailUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    //    NSString *charactersToEscape = @"?!@#$^&%*+,:;='\"`<>()[]{}/\\| ";
    //
    //    NSCharacterSet *allowedCharacters = [[NSCharacterSet characterSetWithCharactersInString:charactersToEscape] invertedSet];
    //
    //     NSString *mailPath = [mailUrl stringByAddingPercentEncodingWithAllowedCharacters:allowedCharacters];
    //     [[UIApplication sharedApplication] openURL:[NSURL URLWithString:mailPath] options:nil completionHandler:nil];
    [selfClass test];
}

-(void)test{
//    NSArray *res = @[@"A", @"B", @"C", @"D", @"E"];
//       NSLog(@"res[5] = %@",[res objectAtIndex:5]);
//       NSLog(@"res[5] = %@",res[5]);
        NSLog(@"%s", __func__);
       CFRunLoopRef runloop = CFRunLoopGetCurrent();
       CFArrayRef allmodels = CFRunLoopCopyAllModes(runloop);
       
       while (!self.isCatch) {
           NSArray *arr = (__bridge NSArray *)allmodels;
           for (int i = 0; i < arr.count; i ++) {
               NSString *str = arr[i];
               CFRunLoopRunInMode((CFStringRef)str, 0.001, false);
           }
       }
       CFRelease(allmodels);
}

static int s_fatal_signals[] = {
    SIGABRT,//（信号6）
    SIGBUS,
    SIGFPE,
    SIGILL,
    SIGSEGV,
    SIGTRAP,
    SIGTERM,
    SIGKILL,
};

static int s_fatal_signal_num = sizeof(s_fatal_signals) / sizeof(s_fatal_signals[0]);

void UncaughtExceptionHandler(NSException *exception) {
    NSArray *exceptionArray = [exception callStackSymbols]; //得到当前调用栈信息
    NSString *exceptionReason = [exception reason];       //非常重要，就是崩溃的原因
    NSString *exceptionName = [exception name];           //异常类型
}

void SignalHandler(int code)
{
    NSLog(@"signal handler = %d",code);
}

void InitCrashReport()
{
    //系统错误信号捕获
    for (int i = 0; i < s_fatal_signal_num; ++i) {
        signal(s_fatal_signals[i], SignalHandler);
    }
    
    //oc未捕获异常的捕获预祝考上
    NSSetUncaughtExceptionHandler(&UncaughtExceptionHandler);
}
 
@end
