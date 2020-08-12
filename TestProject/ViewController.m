//
//  ViewController.m
//  TestProject
//
//  Created by BDKid on 2020/8/12.
//  Copyright © 2020 BDKid. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor orangeColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    NSLog(@"%s", __func__);
    
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"WYW" withExtension:@"text"];
    
    UIDocumentInteractionController *documentInteractionController = [UIDocumentInteractionController interactionControllerWithURL:url];
    [documentInteractionController presentPreviewAnimated:YES]; // 预览文件

}
@end
