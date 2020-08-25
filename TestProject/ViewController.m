//
//  ViewController.m
//  TestProject
//
//  Created by BDKid on 2020/8/12.
//  Copyright © 2020 BDKid. All rights reserved.
//

#import "ViewController.h"
#import "TestViewController.h"

@interface ViewController ()<UIDocumentInteractionControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     
    self.view.backgroundColor = [UIColor orangeColor];
     
  
       
//       
//       CFRunLoopRef runloop = CFRunLoopGetCurrent();
//       CFArrayRef allmodels = CFRunLoopCopyAllModes(runloop);
//
//       while (!self.isCatch) {
//           NSArray *arr = (__bridge NSArray *)allmodels;
//           for (int i = 0; i < arr.count; i ++) {
//               NSString *str = arr[i];
//               CFRunLoopRunInMode((CFStringRef)str, 0.001, false);
//           }
//       }
//       CFRelease(allmodels);
//
 
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    /*

     TestViewController *testViewController = [[TestViewController alloc] init];
     [self presentViewController:testViewController animated:YES completion:nil];
     */
    [self test3];
}


-(void)test3{
    void (^block)(void) = ^{
        NSLog(@"Hello");
    };
 
    NSLog(@"%@", [block class]);
    NSLog(@"%@", [[block class] superclass]);
    NSLog(@"%@", [[[block class] superclass] superclass]);
    NSLog(@"%@", [[[[block class] superclass] superclass] superclass]);

}
-(void)test2 {

    __block int a = 10;
    NSLog(@"进去前%p", &a);
    
    void(^block)(void) = ^{
    
        a++;
        NSLog(@"进去后%p", &a);
    };
    NSLog(@"完成后%p", &a);

    block();
}

@end
