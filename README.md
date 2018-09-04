# Use CocoaPods
 pod 'SKImagePicker', '~> 1.0.1'
 
 Use in Your Project
 
 # Import "SKImagePicker.h"
 
 [SKImagePickerView imagePickerWithPushControl:self ReturnData:^(NSData *data) {
        UIImage *image = [UIImage imageWithData:data];
        self.imageView.image = image;
    }];
