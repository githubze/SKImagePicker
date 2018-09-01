Pod::Spec.new do |spec|
  spec.name         = 'SKImagePicker'
  spec.version      = 'v1.0.0'
  spec.license      = { :type => 'BSD' }
  spec.homepage     = 'https://github.com/githubze/SKImagePicker'
  spec.authors      = { '阿汤哥' => '1424395628@qq.com' }
  spec.platform     = :ios,'8.0'
  spec.summary      = '一行代码搞定调相册，并实现图片压缩。'
  spec.source       = { :git => 'https://github.com/githubze/SKImagePicker.git', :tag => 'v1.0.0' }
  spec.source_files = "SKImagePicker", "SKImagePicker/**/*.{h,m}"
end