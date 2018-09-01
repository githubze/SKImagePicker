//
//  QuickControl.h
//  FreeLimit1413
//
//  Created by mac on 14-6-25.
//  Copyright (c) 2014年 徐泽. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/* 快速创建Label的方法 */

@interface UILabel (QuickControl)
+(id)labelWithFrame:(CGRect)frame text:(NSString *)text textColor:(UIColor*)color font:(UIFont *)font;
@end


/*快速创建Button的方法*/

@interface UIButton (QuickControl)
+(id)buttonWithFrame:(CGRect)frame
               title:(NSString *)title
          titleColor:(UIColor*)titleColor font:(UIFont *)font image:(NSString *)image
               color:(UIColor *)color tag:(NSInteger)num target:(id)target
              action:(SEL)action;
@end


/* 快速创建View的方法 */

@interface UIView (QuickControl)
+(id)viewWithFrame:(CGRect)frame
   backgroundcolor:(UIColor *)color;
@end


/* 快速创建ImageView的方法 */

@interface UIImageView (QuickControl)
+(id)imageViewWithFrame:(CGRect)frame
                  image:(NSString *)imageName;
@end


/* 快速创建TextField的方法 */

@interface UITextField (QuickControl)
+(id)textFieldWithFrame:(CGRect)frame placeholder:(NSString *)placeholder textColor:(UIColor*)color textFont:(UIFont *)font;
@end


/* 快速创建TableView的方法 */

@interface UITableView (QuickControl)
+(id)tableViewWithFrame:(CGRect)frame style:(UITableViewStyle)style delegate:(id)delegate backgroundColor:(UIColor *)bgColor;
@end


/* 快速创建CollectionView的方法 */

@interface UICollectionView (QuickControl)
+(id)collectionViewWithFrame:(CGRect)frame setScrollDirection:(NSInteger)UICollectionViewScrollDirection delegate:delegate;
@end


/* 快速创建ScrollView的方法 */

@interface UIScrollView (QuickControl)
+(id)scrollViewWithFrame:(CGRect)frame contentSize:(CGSize)size delegate:(id)delegate;
@end

@interface QuickControl : NSObject

//判断系统版本
+(int)osVersion;

//获取屏幕高度
+(float)screenHeight;
//获取屏幕宽度
+(float)screenWidth;
@end
