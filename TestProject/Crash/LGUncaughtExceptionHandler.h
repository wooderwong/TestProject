//
//  LGUncaughtExceptionHandler.h
//  TestProject
//
//  Created by BDKid on 2020/8/19.
//  Copyright © 2020 BDKid. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LGUncaughtExceptionHandler : NSObject

+(void)installUncaughtExceptionHandler;
@property(nonatomic, assign) BOOL isCatch;

@end

NS_ASSUME_NONNULL_END
