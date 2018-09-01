//
//  QuickControl.m
//  FreeLimit1413
//
//  Created by mac on 14-6-25.
//  Copyright (c) 2014年 徐泽. All rights reserved.
//

#import "QuickControl.h"

//快速创建Label的方法
@implementation UILabel (QuickControl)
+(id)labelWithFrame:(CGRect)frame text:(NSString *)text textColor:(UIColor*)color font:(UIFont *)font;
{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.text = text;
    label.font = font;
    label.textColor = color;
    return label;
}
@end

//快速创建Button的方法
@implementation UIButton (QuickControl)
+(id)buttonWithFrame:(CGRect)frame
               title:(NSString *)title
          titleColor:(UIColor*)titleColor font:(UIFont *)font image:(NSString *)image
               color:(UIColor *)color tag:(NSInteger)num target:(id)target
              action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    button.backgroundColor = color;
    [button setTitle:title forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    button.titleLabel.font = font;
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    button.tag = num;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}
@end

//快速创建View的方法
@implementation UIView (QuickControl)
+(id)viewWithFrame:(CGRect)frame
   backgroundcolor:(UIColor *)color
{
    UIView *view = [[UIView alloc] initWithFrame:frame];
    view.backgroundColor = color;
    return view;
}
@end

//快速创建imageView的方法
@implementation UIImageView (QuickControl)
+(id)imageViewWithFrame:(CGRect)frame
                  image:(NSString *)imageName
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    imageView.image = [UIImage imageNamed:imageName];
    imageView.layer.masksToBounds = YES;
    imageView.userInteractionEnabled = YES;
    return imageView;
}
@end

//快速创建TextField的方法
@implementation UITextField (QuickControl)
+(id)textFieldWithFrame:(CGRect)frame placeholder:(NSString *)placeholder textColor:(UIColor*)color textFont:(UIFont *)font{
    UITextField *textField = [[UITextField alloc] initWithFrame:frame];
    textField.placeholder = placeholder;
    textField.textColor = color;
    textField.font = font;
    return textField;
}
@end

//快速创建tableView的方法
@implementation UITableView (QuickControl)
+(id)tableViewWithFrame:(CGRect)frame style:(UITableViewStyle)style delegate:(id)delegate backgroundColor:(UIColor *)bgColor{
    UITableView * tableView = [[UITableView alloc] initWithFrame:frame style:style];
    tableView.dataSource = delegate;
    tableView.delegate = delegate;
    tableView.backgroundColor = bgColor;
    tableView.showsVerticalScrollIndicator = NO;
    tableView.showsHorizontalScrollIndicator = NO;
    return tableView;
}

@end

//快速创建ScrollView的方法
@implementation UIScrollView (QuickControl)
+(id)scrollViewWithFrame:(CGRect)frame contentSize:(CGSize)size delegate:(id)delegate{
    UIScrollView *scroll = [[UIScrollView alloc] init];
    scroll.frame = frame;
    scroll.contentSize = size;
    scroll.showsHorizontalScrollIndicator = NO;
    scroll.showsVerticalScrollIndicator = NO;
    scroll.delegate = delegate;
    return scroll;
}
@end

//快速创建collectionView的方法
@implementation UICollectionView (QuickControl)
+(id)collectionViewWithFrame:(CGRect)frame setScrollDirection:(NSInteger)UICollectionViewScrollDirection delegate:delegate{
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirection];
    
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:flowLayout];
    collection.delegate = delegate;
    collection.dataSource = delegate;
    collection.backgroundColor = [UIColor clearColor];
    collection.showsVerticalScrollIndicator = NO;
    collection.showsHorizontalScrollIndicator = NO;
    collection.bounces = NO;
    collection.scrollsToTop = NO;
    
    return collection;
}
@end

@implementation QuickControl
//判断系统版本
+(int)osVersion
{
    //使用UIDevice设别类获取版本, 名字.....
    return [[[UIDevice currentDevice] systemVersion] intValue];
}
//获取屏幕高度
+(float)screenHeight
{
    //使用 UIScreen类获取
    return [[UIScreen mainScreen] bounds].size.height;
}
//获取屏幕宽度
+(float)screenWidth
{
    return [[UIScreen mainScreen] bounds].size.width;
}
@end
