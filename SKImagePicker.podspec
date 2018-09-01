Pod::Spec.new do |spec|
  s.name         = 'SKImagePicker'
  s.version      = '1.0.1'
  s.license      = { :type => 'BSD' }
  s.homepage     = 'https://github.com/githubze/SKImagePicker'
  s.authors      = { '阿汤哥' => '1424395628@qq.com' }
  s.platform     = :ios,'8.0'
  s.summary      = '一行代码搞定调相册，并实现图片压缩。'
  s.source       = { :git => 'https://github.com/githubze/SKImagePicker.git', :tag => s.version.to_s }
  s.source_files = "SKImagePicker", "SKImagePicker/**/*.{h,m}" 
 s.requires_arc = true
end