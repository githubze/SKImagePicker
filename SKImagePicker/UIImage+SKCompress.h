//
//  UIImage+SKCompress.h
//  365sk
//
//  Created by apple on 2018/5/30.
//  Copyright © 2018年 徐泽. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (SKCompress)

-(NSData *)compressImage;

-(NSData *)compressWithMaxLength:(NSUInteger)maxLength;

@end
