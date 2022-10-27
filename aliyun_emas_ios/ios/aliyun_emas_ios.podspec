#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = 'aliyun_emas_ios'
  s.version          = '0.0.1'
  s.summary          = 'An iOS implementation of the aliyun_emas plugin.'
  s.description      = <<-DESC
  An iOS implementation of the aliyun_emas plugin.
                       DESC
  s.homepage         = 'http://kimmy.me'
  s.license          = { :type => 'MIT', :file => '../LICENSE' }
  s.author           = { 'Kimmy' => 'hi@kimmy.me' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'

  s.platform = :ios, '9.0'
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
end
