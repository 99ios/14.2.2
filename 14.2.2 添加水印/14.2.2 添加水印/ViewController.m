//
//  ViewController.m
//  14.2.2 添加水印
//
//  Created by 李维佳 on 2017/4/5.
//  Copyright © 2017年 Liz. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+MYImage.h"
@interface ViewController ()

@end

@implementation ViewController

-(UIImage *)addWatermarkInImage:(UIImage *) image WithText:(NSString *) string {
    //开启一个图形上下文
    UIGraphicsBeginImageContext(image.size);
    //绘制上下文：1-绘制图片
    [image drawAtPoint:CGPointMake(0, 20)];
    //绘制上下文：2-添加文字到上下文
    NSDictionary *dict = @{
                           NSFontAttributeName:[UIFont systemFontOfSize:40.0],
                           NSForegroundColorAttributeName:[UIColor blackColor]
                           };
    [string drawAtPoint:CGPointMake(0, 20)
         withAttributes:dict];
    //从图形上下文中获取合成的图片
    UIImage * watermarkImage = UIGraphicsGetImageFromCurrentImageContext();
    //关闭上下文
    UIGraphicsEndImageContext();
    return watermarkImage;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *image = [UIImage imageNamed:@"99logo"];
    NSString *string = @"九九学院";
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake(0, 0, 200, 200);
    //添加水印
//    imageView.image = [self addWatermarkInImage:image WithText:string];
//    //添加水印
    imageView.image = [UIImage image:image addWatermarkWithString:string];
    //添加到主视图
    [self.view addSubview:imageView];
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
