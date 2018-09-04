//
//  SKImageSelectView.m
//  365sk
//
//  Created by apple on 2018/5/16.
//  Copyright © 2018年 徐泽. All rights reserved.
//

/**
 RGB
 */
#define UIColorFromRGB(rgbValue)          [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

/**
 平方常体
 */
#define kPfFont(a)          [UIFont fontWithName:@"PingFangSC-Regular" size:a]

#define PickerScreenWidth [UIScreen mainScreen].bounds.size.width
#define PickerScreenHeight [UIScreen mainScreen].bounds.size.height

#import "SKImageSelectView.h"
#import "QuickControl.h"

@implementation SKImageSelectView

- (instancetype)initWithFrame:(CGRect)frame selectIndex:(selectIndex)sindex{
    if (self = [super initWithFrame:frame]) {
        self.selectIndex = ^(NSInteger index) {
            sindex(index);
        };
        [self setUI];
    }
    return self;
}
- (void)setUI{
    [self addSubview:self.bgView];
    [self addSubview:self.sheetView];
    [self.sheetView addSubview:self.whiteView];
    [self.whiteView addSubview:self.nameLabel];
    [self.whiteView addSubview:self.button1];
    [self.whiteView addSubview:self.lineView];
    [self.whiteView addSubview:self.button2];
    [self.sheetView addSubview:self.button3];
    
    //如果使用mesonry布局
//    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self);
//    }];
//
//    [self.whiteView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.sheetView);
//        make.left.equalTo(self.sheetView).offset(19);
//        make.right.equalTo(self.sheetView).offset(-19);
//        make.height.mas_offset(185);
//    }];
//
//    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.whiteView).offset(13);
//        make.left.right.equalTo(self.whiteView);
//        make.height.mas_offset(14);
//    }];
//
//    [self.button1 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.equalTo(self.whiteView);
//        make.top.equalTo(self.nameLabel.mas_bottom).offset(24);
//        make.height.mas_offset(49);
//    }];
//
//    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.sheetView).offset(85);
//        make.top.equalTo(self.button1.mas_bottom).offset(12);
//        make.height.mas_offset(0.5);
//        make.right.equalTo(self.sheetView).offset(-85);
//    }];
//
//    [self.button2 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.equalTo(self.whiteView);
//        make.top.equalTo(self.lineView.mas_bottom).offset(13);
//        make.height.mas_offset(49);
//    }];
//
//    [self.button3 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.sheetView).offset(19);
//        make.right.equalTo(self.sheetView).offset(-19);
//        make.height.mas_offset(49);
//        make.top.equalTo(self.whiteView.mas_bottom).offset(8);
//    }];
    
    
    //使用frame
    self.bgView.frame = self.bounds;
    self.whiteView.frame = CGRectMake(19, 0, PickerScreenWidth-38, 185);
    self.nameLabel.frame = CGRectMake(0, 13, PickerScreenWidth-38, 14);
    self.button1.frame = CGRectMake(0, CGRectGetMaxY(self.nameLabel.frame)+24, PickerScreenWidth-38, 49);
    self.lineView.frame = CGRectMake(85, CGRectGetMaxY(self.button1.frame)+12, PickerScreenWidth-85*2, 0.5);
    self.button2.frame = CGRectMake(0, CGRectGetMaxY(self.lineView.frame)+13, PickerScreenWidth-38, 49);
    self.button3.frame = CGRectMake(19, CGRectGetMaxY(self.whiteView.frame)+8, PickerScreenWidth-38, 49);
}

#pragma mark - property
-(UIView *)bgView{
    if (!_bgView) {
        _bgView = [UIView viewWithFrame:CGRectZero backgroundcolor:[UIColor blackColor]];
        _bgView.alpha = 0.3;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hide)];
        [_bgView addGestureRecognizer:tap];
    }
    return _bgView;
}

-(UIView *)sheetView{
    if (!_sheetView) {
        _sheetView = [UIView viewWithFrame:CGRectMake(0, PickerScreenHeight, PickerScreenWidth, 251) backgroundcolor:[UIColor clearColor]];
        [UIView animateWithDuration:0.2 animations:^{
            self->_sheetView.frame = CGRectMake(0, PickerScreenHeight-251, PickerScreenWidth, 251);
        }];
    }
    return _sheetView;
}

- (UIView *)whiteView{
    if (!_whiteView) {
        _whiteView = [UIView viewWithFrame:CGRectZero backgroundcolor:UIColorFromRGB(0xffffff)];
        _whiteView.layer.cornerRadius = 10;
    }
    return _whiteView;
}

- (UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [UILabel labelWithFrame:CGRectZero text:@"选择上传方式" textColor:UIColorFromRGB(0x666666) font:kPfFont(15)];
        _nameLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _nameLabel;
}

-(UIButton *)button1{
    if (!_button1) {
        _button1 = [UIButton buttonWithFrame:CGRectZero title:@"拍照" titleColor:UIColorFromRGB(0x333333) font:kPfFont(17) image:nil color:[UIColor whiteColor] tag:1 target:self action:@selector(buttonclick:)];
    }
    return _button1;
}

-(UIButton *)button2{
    if (!_button2) {
        _button2 = [UIButton buttonWithFrame:CGRectZero title:@"图库" titleColor:UIColorFromRGB(0x333333) font:kPfFont(17) image:nil color:[UIColor whiteColor] tag:2 target:self action:@selector(buttonclick:)];
    }
    return _button2;
}

-(UIButton *)button3{
    if (!_button3) {
        _button3 = [UIButton buttonWithFrame:CGRectZero title:@"取消" titleColor:UIColorFromRGB(0xF54F53) font:kPfFont(17) image:nil color:[UIColor whiteColor] tag:3 target:self action:@selector(buttonclick:)];
        _button3.layer.cornerRadius = 10;
    }
    return _button3;
}

-(UIView *)lineView{
    if (!_lineView) {
        _lineView = [UIView viewWithFrame:CGRectZero backgroundcolor:UIColorFromRGB(0xEEEEEE)];
    }
    return _lineView;
}

#pragma mark - click

-(void)buttonclick:(UIButton *)button{
    _selectIndex(button.tag);
}

- (void)hide{
    _selectIndex(3);
}

@end
