//
//  SKImageSelectView.h
//  365sk
//
//  Created by apple on 2018/5/16.
//  Copyright © 2018年 徐泽. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^selectIndex)(NSInteger index);

@interface SKImageSelectView : UIView

- (instancetype)initWithFrame:(CGRect)frame selectIndex:(selectIndex)sindex;

/**
 背景色
 */
@property (strong, nonatomic) UIView *bgView;

/**
 sheetview
 */
@property (strong, nonatomic) UIView *sheetView;

/**
 白色背景
 */
@property (nonatomic, strong) UIView * whiteView;

/**
 标题
 */
@property (nonatomic, strong) UILabel * nameLabel;

/**
 相机
 */
@property (strong, nonatomic) UIButton *button1;

/**
 相册
 */
@property (strong, nonatomic) UIButton *button2;

/**
 线
 */
@property (strong, nonatomic) UIView  * lineView;

/**
 取消
 */
@property (strong, nonatomic) UIButton *button3;

/**
 点击触发
 */
@property (strong, nonatomic) selectIndex selectIndex;

@end
