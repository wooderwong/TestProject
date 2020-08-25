//
//  AppDelegate.m
//  TestProject
//
//  Created by BDKid on 2020/8/12.
//  Copyright © 2020 BDKid. All rights reserved.
//

#import "AppDelegate.h" 
#import <mach/mach.h>
#include <execinfo.h>



@interface AppDelegate ()

@end

@implementation AppDelegate
@synthesize window = _window;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
      if (@available(iOS 13, *)) {
          
      }else{
          _window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen]bounds]];
          _window.rootViewController = [[SwiftViewController alloc] init];
          [_window makeKeyAndVisible];

      }
//    registerSignalHandler();
    NSSetUncaughtExceptionHandler(registerSignalHandler);

    return YES;
}

void registerSignalHandler(void) {
    signal(SIGSEGV, handleSignalException);
    signal(SIGFPE, handleSignalException);
    signal(SIGBUS, handleSignalException);
    signal(SIGPIPE, handleSignalException);
    signal(SIGHUP, handleSignalException);
    signal(SIGINT, handleSignalException);
    signal(SIGQUIT, handleSignalException);
    signal(SIGABRT, handleSignalException);
    signal(SIGILL, handleSignalException);
    
}

void handleSignalException(int signal) {
    NSMutableString *crashString = [[NSMutableString alloc] init];
    void *callstack[128];
    int i, frames = backtrace(callstack, 128);
    char **traceChar = backtrace_symbols(callstack, frames);
    for (i = 0; i <frames; ++i) {
        [crashString appendFormat:@"%s\n", traceChar[i]];
    }    NSLog(@"%@", crashString);
    NSLog(@"crashString - %@",crashString);
}

#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
