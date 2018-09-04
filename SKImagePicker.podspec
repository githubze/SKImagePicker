Pod::Spec.new do |s|
  s.name         = "SKImagePicker"
  s.version      = "1.0.2"
  s.summary      = "An iOS ImagePicker."
  s.homepage     = "https://github.com/githubze/SKImagePicker.git"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { 'githubze' => '1424395628@qq.com' }
  s.source       = { :git => "https://github.com/githubze/SKImagePicker.git", :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.source_files = "SKImagePicker/**/*.{h,m}"
  s.requires_arc = true

end
