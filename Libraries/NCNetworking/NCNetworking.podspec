#
# Be sure to run `pod lib lint NCNetworking.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'NCNetworking'
  s.version          = '0.1.0'
  s.summary          = 'A short description of NCNetworking.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/mulsjkool'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Chinh Phung' => 'chinhhubt96@gmail.com' }
  s.source           = { :path => '', :tag => s.version.to_s }  
  s.ios.deployment_target = '15.0'
  s.source_files = 'NCNetworking/Sources/**/*.{swift}'
  
  s.dependency 'Moya/Combine', '~> 15.0'
  s.dependency 'CombineExt'
  s.dependency 'Alamofire'
  s.dependency 'ReachabilitySwift'
  s.dependency 'NCLogger'
end
