//
//  DocumentInteractionController.m
//  TestProject
//
//  Created by BDKid on 2020/8/12.
//  Copyright © 2020 BDKid. All rights reserved.
//

#import "DocumentInteractionController.h"

@interface DocumentInteractionController ()<UIDocumentInteractionControllerDelegate>

@end

@implementation DocumentInteractionController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIActivityViewController *dic = [[UIActivityViewController alloc] initWithActivityItems:@[] applicationActivities:@[]];
    
    self.view.backgroundColor = [UIColor greenColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    NSLog(@"%s", __func__);
     
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"WYW" withExtension:@"text"];
    NSRunLoop *roop = [[NSRunLoop alloc] init];
    [roop addTimer:[[NSTimer alloc] init] forMode:NSRunLoopCommonModes];
    
    UIDocumentInteractionController *documentInteractionController = [UIDocumentInteractionController interactionControllerWithURL:url];
//    documentInteractionController.UTI = @"text";
    documentInteractionController.delegate = self;
    [documentInteractionController presentPreviewAnimated:YES]; // 预览文件
    [documentInteractionController presentOptionsMenuFromRect:self.view.bounds inView:self.view animated:YES]; //菜单操作 操
    
}


// If preview is supported, this provides the view controller on which the preview will be presented.
// This method is required if preview is supported.
// If presenting atop a navigation stack, provide the navigation controller in order to animate in a manner consistent with the rest of the platform.
- (UIViewController *)documentInteractionControllerViewControllerForPreview:(UIDocumentInteractionController *)controller{
    NSLog(@"%s", __func__);
    return  self;;
}

// If preview is supported, these provide the view and rect that will be used as the starting point for the animation to the full screen preview.
// The actual animation that is performed depends upon the platform and other factors.
// If documentInteractionControllerRectForPreview is not implemented, the specified view's bounds will be used.
// If documentInteractionControllerViewForPreview is not implemented, the preview controller will simply fade in instead of scaling up.
- (nullable UIView *)documentInteractionControllerViewForPreview:(UIDocumentInteractionController *)controller{
    NSLog(@"%s", __func__);

    return self.view;
}
- (CGRect)documentInteractionControllerRectForPreview:(UIDocumentInteractionController *)controller{
    NSLog(@"%s", __func__);
    return self.view.frame;
}
 
- (void)documentInteractionControllerWillBeginPreview:(UIDocumentInteractionController *)controller{
    NSLog(@"%s", __func__);
}

- (void)documentInteractionControllerDidEndPreview:(UIDocumentInteractionController *)controller{
    
    NSLog(@"%s", __func__);
}
 
- (void)documentInteractionControllerWillPresentOptionsMenu:(UIDocumentInteractionController *)controller{
    NSLog(@"%s", __func__);
}

- (void)documentInteractionControllerDidDismissOptionsMenu:(UIDocumentInteractionController *)controller{
    NSLog(@"%s", __func__);
}
 
- (void)documentInteractionControllerWillPresentOpenInMenu:(UIDocumentInteractionController *)controller{
    NSLog(@"%s", __func__);
}

- (void)documentInteractionControllerDidDismissOpenInMenu:(UIDocumentInteractionController *)controller{
    NSLog(@"%s", __func__);
}
 
- (void)documentInteractionController:(UIDocumentInteractionController *)controller willBeginSendingToApplication:(nullable NSString *)application{
    NSLog(@"%s", __func__);
}

- (void)documentInteractionController:(UIDocumentInteractionController *)controller didEndSendingToApplication:(nullable NSString *)application{
    NSLog(@"%s", __func__);
}
 /**HashMap内部是通过一个数组实现的，只是这个数组比较特殊，数组里存储的元素是一个Entry实体(在JAVA8中为Node)，这个Entry实体主要包含key、value以及一个指向自身的next指针。 HashMap是基于hashing实现的，当进行put操作时，根据传递的key值得到它的hashcode，然后再用这个hashcode与数组的长度进行模运算，得到一个int值，就是Entry要存储在数组的位置（下标）；当通过get方法获取指定key的值时，会根据这个key算出它的hash值（数组下标），根据这个hash值获取数组下标对应的Entry，然后判断Entry里的key，hash值或者通过equals()比较是否与要查找的相同，如果相同，返回value，否则的话，遍历该链表（有可能就只有一个Entry，此时直接返回null），直到找到为止，否则返回null。
  ----2020年7月12日更新----
  朋友做了一个很方便的组队打卡小程序，UI和功能都很棒，欢迎大家体验使用。
  传送门→ https://ojeveryday.com/#/submit

  本人师弟做的视频讲解系列传送门→：https://space.bilibili.com/473759444

  目录
  写在前面
  正文
  数据结构类题目
  具体算法类题目
  组队学习
  写在前面
  面试季来了，不管是作为面试者还是以后作为面试官，了解算法这门程序员之间的沟通方式都是非常必要的。

  找过工作的朋友应该都听说过《剑指offer》，笔者也是战5渣，本文主要对我这十多天刷过的《剑指offer》做个简单的分类小结，方便后面专项复(练)习~

  剑指offer推荐刷题地址：

  Leetcode: https://leetcode-cn.com/problemset/lcof (官方授权)
  牛客网：https://www.nowcoder.com/ta/coding-interviews
  我的所有AC题解(Python语言)，每道题都写了点自己的思路：
  https://github.com/nlpjoe/Coding4Interviews

  正文
  笔者是NLP方向，这两篇相关方向的面经写得很不错：

  https://zhuanlan.zhihu.com/p/36387348

  https://zhuanlan.zhihu.com/p/45802662

  如果您是高分段选手，看完觉得不用刷题，请点(x)然后私信我，务必要收下我这个好朋友=￣ω￣=

  《剑指offer》剖析了80个典型的编程面试题，系统整理基础知识、代码质量、解题思路、优化效率和综合能力这5个面试要点。但是我刷题只有牛客网上的66题。

  如果是单纯的面试需求，剑指offer的优先级肯定是在Leetcode之前，总的说它有三个优点：

  1.很可能在面试中出现原题
  2.约66题，题量少，但是涵盖的内容较全
  3.能培养一个良好的刷题习惯
  它的缺点是：

  1.只有66题，刷着容易过拟合
  2.动态规划的题比较少，因此需要在Leetcode上专项训练。
  算法题主要分成数据结构和具体算法部分，简单归类如下。基本每道题都很精彩，所以这里就不一一洗写了，题解可以看看我的代码仓库或者讨论区的内容。

  数据结构类题目
  LinkedList
  003-从尾到头打印链表
  014-链表中倒数第k个结点
  015-反转链表
  016-合并两个或k个有序链表
  025-复杂链表的复制
  036-两个链表的第一个公共结点
  055-链表中环的入口结点
  056-删除链表中重复的结点
  Tree
  004-重建二叉树
  017-树的子结构
  018-二叉树的镜像
  022-从上往下打印二叉树
  023-二叉搜索树的后序遍历序列
  024-二叉树中和为某一值的路径
  026-二叉搜索树与双向链表
  038-二叉树的深度
  039-平衡二叉树
  057-二叉树的下一个结点
  058-对称的二叉树
  059-按之字形顺序打印二叉树
  060-把二叉树打印成多行
  061-序列化二叉树
  062-二叉搜索树的第k个结点
  Stack & Queue
  005-用两个栈实现队列
  020-包含min函数的栈
  021-栈的压入、弹出序列
  044-翻转单词顺序列(栈)
  064-滑动窗口的最大值(双端队列)
  Heap
  029-最小的K个数
  Hash Table
  034-第一个只出现一次的字符
  图
  065-矩阵中的路径(BFS)
  066-机器人的运动范围(DFS)
  具体算法类题目
  斐波那契数列
  007-斐波拉契数列
  008-跳台阶
  009-变态跳台阶
  010-矩形覆盖
  搜索算法
  001-二维数组查找
  006-旋转数组的最小数字（二分查找）
  037-数字在排序数组中出现的次数（二分查找）
  全排列
  027-字符串的排列
  动态规划
  030-连续子数组的最大和
  052-正则表达式匹配(我用的暴力)
  回溯
  065-矩阵中的路径(BFS)
  066-机器人的运动范围(DFS)
  排序
  035-数组中的逆序对(归并排序)
  029-最小的K个数(堆排序)
  029-最小的K个数(快速排序)
  位运算
  011-二进制中1的个数
  012-数值的整数次方
  040-数组中只出现一次的数字
  其他算法
  002-替换空格
  013-调整数组顺序使奇数位于偶数前面
  028-数组中出现次数超过一半的数字
  031-整数中1出现的次数（从1到n整数中1出现的次数）
  032-把数组排成最小的数
  033-丑数
  041-和为S的连续正数序列(滑动窗口思想)
  042-和为S的两个数字(双指针思想)
  043-左旋转字符串(矩阵翻转)
  046-孩子们的游戏-圆圈中最后剩下的数(约瑟夫环)
  051-构建乘积数组
  节奏与方法
  我个人觉得数据结构和DP在面试中手写代码的几率比较高，因此笔者目前的刷题节奏主要是：

  剑指offer->Leetcode动态规划->面试前再过一遍剑指offer

  每个人基础不一样，不过我觉得刷题还是要全职专项的刷。

  有个重要的点是：每道题做完一定要去讨论区！

  讨论区有非常精简的大神级代码，你好不容易AC了一道题准备去讨论区吹(装)水(逼)，点开一看，“握草，还可以这样”。

  思考为什么他可以写出这么好的代码，把每道题的思路理解后用笔记本记录下来，争取刷到融会贯通，即看见有个题能自动归类到某个方面，这样有一定好处。面试最重要的是让面试官日后能愿意与你以后一起工作，因此沟通交流非常重要。比如有时候面试需要交流，看着像是一道排序的题做不出来，就可以跟面试官交流：“我有几个不成熟的想法，一排序，二动态规划，三是直接搜索算法”，面试官可能就给个提示：“你先用排序试试吧“。

  当然笔者还没到这境界，等面试结束后再来写后续部分吧。

  组队学习
  刷题我是和几个熟人一起刷的。如果您找不到伙伴一起刷题，可以微博(爱编程的周鸟)联系我，或者微信联系我：echoooo741（不一定能加）

  私信暗号“Leetcode组队刷题”，自动拉您入群。

  作者：nlpjoe
  链接：https://www.jianshu.com/p/53f6bf6f8d50
  来源：简书
  著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
  */
@end
