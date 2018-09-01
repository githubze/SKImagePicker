//
//  UIImage+SKCompress.m
//  365sk
//
//  Created by apple on 2018/5/30.
//  Copyright © 2018年 徐泽. All rights reserved.
//

#import "UIImage+SKCompress.h"

@implementation UIImage (SKCompress)

-(NSData *)compressImage{
    
    UIImage * resultImage = self;
    
    CGSize size = CGSizeMake(self.size.width*0.8, resultImage.size.height*0.8);
    
    UIGraphicsBeginImageContext(size);
    [resultImage drawInRect:CGRectMake(0, 0, size.width, size.height)];
    resultImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    NSData * data = UIImageJPEGRepresentation(resultImage, 0.1);
    
    return data;
}

-(NSData *)compressWithMaxLength:(NSUInteger)maxLength{
    // Compress by quality
    CGFloat compression = 1;
    NSData *data = UIImageJPEGRepresentation(self, 0.1);
    //NSLog(@"Before compressing quality, image size = %ld KB",data.length/1024);
    if (data.length < maxLength) return data;
    
//    CGFloat max = 0.1;
//    CGFloat min = 0;
//    for (int i = 0; i < 6; ++i) {
//        compression = (max + min) / 2;
//        data = UIImageJPEGRepresentation(self, compression);
//        //NSLog(@"Compression = %.1f", compression);
//        //NSLog(@"In compressing quality loop, image size = %ld KB", data.length / 1024);
//        if (data.length < maxLength * 0.9) {
//            min = compression;
//        } else if (data.length > maxLength) {
//            max = compression;
//        } else {
//            break;
//        }
//    }
    //NSLog(@"After compressing quality, image size = %ld KB", data.length / 1024);
//    if (data.length < maxLength) return data;
    UIImage *resultImage = [UIImage imageWithData:data];
    // Compress by size
    NSUInteger lastDataLength = 0;
    while (data.length > maxLength && data.length != lastDataLength) {
        lastDataLength = data.length;
        CGFloat ratio = (CGFloat)maxLength / data.length;
        //NSLog(@"Ratio = %.1f", ratio);
        CGSize size = CGSizeMake((NSUInteger)(resultImage.size.width * sqrtf(ratio)),
                                 (NSUInteger)(resultImage.size.height * sqrtf(ratio))); // Use NSUInteger to prevent white blank
        UIGraphicsBeginImageContext(size);
        [resultImage drawInRect:CGRectMake(0, 0, size.width, size.height)];
        resultImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        data = UIImageJPEGRepresentation(resultImage, compression);
        //NSLog(@"In compressing size loop, image size = %ld KB", data.length / 1024);
    }
    //NSLog(@"After compressing size loop, image size = %ld KB", data.length / 1024);
    return data;
}

@end
