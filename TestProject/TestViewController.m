//
//  TestViewController.m
//  TestProject
//
//  Created by BDKid on 2020/8/24.
//  Copyright © 2020 BDKid. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()

@property(nonatomic, strong) NSArray *array;
@property(nonatomic, copy) void(^myBlock)(void);

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    
    /*
    NSLog(@"%@ call",NSStringFromSelector(_cmd));
//   NSArray *res = @[@"A", @"B", @"C", @"D", @"E"];
//        NSLog(@"res[5] = %@",[res objectAtIndex:5]);
//        NSLog(@"res[5] = %@",res[5]);
    
    
    void(^block)(void) = ^{
        NSLog(@"Hello block");
    };
    
    NSLog(@")block= %@", block);

    int a = 10;
    void(^block1)(void) = ^{
        NSLog(@"block1 - %d", a);
    };
    block1();
    NSLog(@")block1 = %@", block1);

    
    NSLog(@"block2 %@", ^{
        NSLog(@"block2 - %d", a);
//
    });
    */
    self.array = @[@"A", @"B", @"C"];
    __weak typeof(self) weakSelf = self;
    self.myBlock = ^{
        __strong typeof(self) strongSelf = weakSelf;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            NSLog(@"weakSelf.array = %@", strongSelf.array);
        });
    };
    self.myBlock();
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)test1{
       NSLog(@"%@ call",NSStringFromSelector(_cmd));
    //   NSArray *res = @[@"A", @"B", @"C", @"D", @"E"];
    //        NSLog(@"res[5] = %@",[res objectAtIndex:5]);
    //        NSLog(@"res[5] = %@",res[5]);
        
        
        void(^block)(void) = ^{
            NSLog(@"Hello block");
        };
        
        NSLog(@")block= %@", block);

        int a = 10;
        void(^block1)(void) = ^{
            NSLog(@"block1 - %d", a);
        };
        block1();
        NSLog(@")block1 = %@", block1);

        
        NSLog(@"block2 %@", ^{
            NSLog(@"block2 - %d", a);
    //
        });
        self.array = @[@"A", @"B", @"C"];
        __weak typeof(self) weakSelf = self;
        self.myBlock = ^{
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                NSLog(@"weakSelf.array = %@", weakSelf.array);
            });
        };
        self.myBlock();
}
@end
