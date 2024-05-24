platform :ios, '15.0'

inhibit_all_warnings!

workspace 'Buddha.xcworkspace'
project 'Buddha.xcodeproj'

def networking_lib
  pod 'Moya/Combine', '~> 15.0'
  pod 'Alamofire'
  pod 'NCNetworking', :path => 'Libraries/NCNetworking'
end

def logger_lib
  pod 'NCLogger', :path => 'Libraries/NCLogger'
end

def persistence_lib
  pod 'NCPersistence', :path => 'Libraries/NCPersistence'
end

def common_lib
  pod 'NCCommon', :path => 'Libraries/NCCommon'
end

target 'Buddha' do
  use_frameworks!

  networking_lib
  logger_lib
  persistence_lib
  common_lib
  
  pod 'CombineExt'
  pod 'Stinsen' #Coordinators in SwiftUI. Simple, powerful and elegant.
  pod 'SwiftGen', '~> 6.0'
  pod "Factory"

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '15.0'
    end
  end
  installer.pods_project.targets.each do |target|
        if target.respond_to?(:product_type) and target.product_type == "com.apple.product-type.bundle"
          target.build_configurations.each do |config|
              config.build_settings['CODE_SIGNING_ALLOWED'] = 'NO'
          end
        end
      end
end
