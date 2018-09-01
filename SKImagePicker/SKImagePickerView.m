//
//  SKImagePickerView.m
//  365sk
//
//  Created by apple on 2018/5/16.
//  Copyright © 2018年 徐泽. All rights reserved.
//


#import "SKImagePickerView.h"
#import "SKImageSelectView.h"

@interface SKImagePickerView()

@property (nonatomic) UIWindow * rootWindow;

@property(nonatomic,strong) SKImageSelectView *selectView;

@property (nonatomic,strong) UIViewController *controller;

@property (nonatomic,strong) UIImagePickerController *imagePicker;

@property (strong, nonatomic) ImageData imageData;

@end

@implementation SKImagePickerView

+ (instancetype)shareIntance{
    static SKImagePickerView *shareIntance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareIntance = [[SKImagePickerView alloc] init];
    });
    return shareIntance;
}

+ (void)imagePickerWithPushControl:(UIViewController *)controller ReturnData:(ImageData)imagedata{
    [SKImagePickerView shareIntance].selectView = [[SKImageSelectView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) selectIndex:^(NSInteger index) {
        [[SKImagePickerView shareIntance] selectButtonClickIndex:index];
    }];
    
    [SKImagePickerView shareIntance].imageData = ^(NSData *data) {
        imagedata(data);
    };
    
    [SKImagePickerView shareIntance].controller = controller;
    
    [SKImagePickerView shareIntance].rootWindow = [[UIApplication sharedApplication] keyWindow];
    [[SKImagePickerView shareIntance].rootWindow addSubview:[SKImagePickerView shareIntance].selectView];
}

- (void)selectButtonClickIndex:(NSInteger)index{
    [[SKImagePickerView shareIntance].selectView removeFromSuperview];
    switch (index) {
        case 1: //拍照
        {
            self.isCamera = YES;
            [SKImagePickerView shareIntance].imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
            [[SKImagePickerView shareIntance].controller presentViewController:self.imagePicker animated:YES completion:nil];
        }
            break;
        case 2: //相册
        {
            self.isCamera = NO;
            [SKImagePickerView shareIntance].imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            [[SKImagePickerView shareIntance].controller presentViewController:self.imagePicker animated:YES completion:nil];
        }
            break;
        case 3: //取消
        {
            
        }
            break;
            
        default:
            break;
    }
}

//UIImagePickerControllerOriginalImage
//UIImagePickerControllerEditedImage
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    UIImage *image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
//    NSData *data = [image compressWithMaxLength:60*1024];
//    NSData *data = UIImageJPEGRepresentation(image, 0.1);
    NSData *data = [image compressImage];
    
    [SKImagePickerView shareIntance].imageData(data);
    
    if (self.isCamera) {
        UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    }
    
    [[SKImagePickerView shareIntance].imagePicker dismissViewControllerAnimated:YES completion:nil];
}


-(void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error
 contextInfo:(void *)contextInfo{
    
}

-(UIImagePickerController *)imagePicker{
    if (!_imagePicker) {
        _imagePicker = [[UIImagePickerController alloc] init];
        _imagePicker.delegate = self;
        _imagePicker.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
        _imagePicker.allowsEditing = NO;
    }
    return _imagePicker;
}

@end
