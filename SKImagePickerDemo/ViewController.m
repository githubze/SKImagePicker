//
//  ViewController.m
//  SKImagePickerDemo
//
//  Created by 阿汤哥 on 2018/8/31.
//  Copyright © 2018年 徐泽. All rights reserved.
//

#import "ViewController.h"
#import "QuickControl.h"
#import "SKImagePickerView.h"

@interface ViewController ()

/**
 图片
 */
@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.imageView = [UIImageView imageViewWithFrame:CGRectMake(0, 0, 80, 80) image:@""];
    self.imageView.backgroundColor = [UIColor grayColor];
    self.imageView.center = CGPointMake(self.view.frame.size.width/2, 100);
    [self.view addSubview:self.imageView];
    
    UIButton *button = [UIButton buttonWithFrame:CGRectMake(0, 0, 100, 40) title:@"上传图片" titleColor:[UIColor blackColor] font:[UIFont systemFontOfSize:15] image:nil color:[UIColor yellowColor] tag:1 target:self action:@selector(buttonClick)];
    button.center = CGPointMake(self.view.frame.size.width/2, CGRectGetMaxY(self.imageView.frame)+50);
    [self.view addSubview:button];
}

- (void)buttonClick{
    
    [SKImagePickerView imagePickerWithPushControl:self ReturnData:^(NSData *data) {
        UIImage *image = [UIImage imageWithData:data];
        self.imageView.image = image;
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
