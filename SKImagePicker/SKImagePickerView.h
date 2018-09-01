//
//  SKImagePickerView.h
//  365sk
//  $(DEVELOPMENT_LANGUAGE)
//  Created by apple on 2018/5/16.
//  Copyright © 2018年 徐泽. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AssetsLibrary/ALAsset.h>
#import <AssetsLibrary/ALAssetsLibrary.h>
#import <AssetsLibrary/ALAssetsGroup.h>
#import <AssetsLibrary/ALAssetRepresentation.h>
#import "UIImage+SKCompress.h"

typedef void (^ImageData)(NSData *data);

@interface SKImagePickerView : NSObject <UIImagePickerControllerDelegate,UINavigationControllerDelegate>

+ (instancetype)shareIntance;

//调取方法
+ (void)imagePickerWithPushControl:(UIViewController *)controller ReturnData:(ImageData)imagedata;

/**
 是否是相机
 */
@property (nonatomic, assign) BOOL isCamera;

@end
