# Use CocoaPods
 pod 'SKImagePicker', '~> 1.0.1'
 
# Use with this code
 
 [SKImagePickerView imagePickerWithPushControl:self ReturnData:^(NSData *data) {
 
        UIImage *image = [UIImage imageWithData:data];
        self.imageView.image = image;
    
 }];
 
 # Display Effect
 
 https://github.com/githubze/myPictureManager/blob/master/39549D7FE5176F3A8989D239637532EB.png


