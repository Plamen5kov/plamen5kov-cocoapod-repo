# coding: utf-8
require 'json'

# Please read very carefully or you will be in world of massive massive pain.
# You been warned!!!
# 
# Versions:
#   - React Native: 0.55.4
#   - cocoapods : 1.5.3
#   - yarn: 1.12.3
#   - node: v8.15.1
#   - npm: 6.4.1
# 
# Source Specs:
#   - https://github.com/newsuk/times-pod-specs.git
#   - https://github.com/CocoaPods/Specs
# 
# Salient Information:
#   - The current supported version of `ReactNative` is 0.55.4. It is picked from NewsUK specs.
#   - The current supported version of `cocoapods` is 1.5.3. It is not important for generating this podspec but it generates 
#     incorrect .xcconfig file for the native app while trying to use this Podspec.
#   - React Native code does not compile on its own without the changes made by plugin cocoapods-fix-react-native. The fixes 
#     are applied as part of the native app Podfile when trying to use this podspec. But fixes cant be made while linting this
#     podspec. 
#   - Linting is disabled while pushing the podspec to specs repo due to above mention issue. This is done by disabling the 
#     validation step in local code for cocoapods gem (Comment out the method call to validate_podspec_files). 
#     A sample path for file to be changed:
#     /usr/local/lib/ruby/gems/2.6.0/gems/cocoapods-1.5.3/lib/cocoapods/command/repo/push.rb
#   - Publish json podspec. Do not publish ruby podspec as it has run time code and it wont work while being used in Podfile.
# 
# Issues:
#   - `pod lib lint` and `pod spec lint` commands fail because React fails to compile without `cocoapods-fix-react-native` patch.
#   - Native app works with cocoapods 1.5.3. Generated Pods fails to compile with cocoapods 1.6.1 (failure in React).
#   - Issues with blue folder vs yellow folder for assets for generated TimesComponents spec. Need to investigate cocoapods why it is doing that.
# 
# Update Podspec Steps (with broken React Native):
#   - Make change in cocoapods:push.rb to disable podspec validation step.
#   - $  s.dependency repo push newsuk TimesComponents.podspec  --verbose --allow-warnings --use-json
#   - Unroll changes in push.rb
# 
# Update Podspec Steps (in future):
#   - These are not complete steps for publishing podspec. Please refer cocoapods documentation for details.
#   - $  s.dependency lib lint TimesComponents.podspec --sources='https://github.com/newsuk/times-pod-specs,https://github.com/CocoaPods/Specs'
#   - $  s.dependency spec lint TimesComponents.podspec --sources='https://github.com/newsuk/times-pod-specs,https://github.com/CocoaPods/Specs' --verbose --allow-warnings
#   - $  s.dependency repo push newsuk TimesComponents.podspec  --verbose --allow-warnings --use-json (assumes you have newsuk podspec repo set!!)

package = JSON.parse(File.read("./ios-app/package.json"))

podspec_version = package["version"]
react_native_version = package["dependencies"]["react-native"]

Pod::Spec.new do |s|
  s.name             = "TimesComponents"
  s.version          = podspec_version
  s.summary          = "Times iOS React components"
  s.description      = "All the things for Times iOS React components including dependencies"
  s.homepage         = "https://www.news.co.uk"
  s.license          = { type: 'MIT', file: 'LICENSE' }
  s.author           = "News UK"
  s.platform         = :ios, '9.0'
  s.swift_version    = '4.2'
  s.source           = { :git => 'https://github.com/newsuk/times-components-ios-artifacts', :tag => "#{s.version}"}
  s.resource_bundles = {
    'TimesComponents' => ['assets/js/index.ios.bundle', 'assets/res/*']
  }
  
  # React, and the subspecs we have to use
   s.dependency 'FBLazyVector', react_native_version #:path => '../times-components/node_modules/react-native/Libraries/FBLazyVector'
   s.dependency 'FBReactNativeSpec', react_native_version #:path => '../times-components/node_modules/react-native/Libraries/FBReactNativeSpec'
   s.dependency 'RCTRequired', react_native_version #:path => '../times-components/node_modules/react-native/Libraries/RCTRequired'
   s.dependency 'RCTTypeSafety', react_native_version #:path => '../times-components/node_modules/react-native/Libraries/TypeSafety'
   s.dependency 'React', react_native_version #:path => '../times-components/node_modules/react-native/'
   s.dependency 'React-Core', react_native_version #:path => '../times-components/node_modules/react-native/'
   s.dependency 'React-CoreModules', react_native_version #:path => '../times-components/node_modules/react-native/React/CoreModules'
   s.dependency 'React-Core/DevSupport', react_native_version #:path => '../times-components/node_modules/react-native/'
   s.dependency 'React-RCTActionSheet', react_native_version #:path => '../times-components/node_modules/react-native/Libraries/ActionSheetIOS'
   s.dependency 'React-RCTAnimation', react_native_version #:path => '../times-components/node_modules/react-native/Libraries/NativeAnimation'
   s.dependency 'React-RCTBlob', react_native_version #:path => '../times-components/node_modules/react-native/Libraries/Blob'
   s.dependency 'React-RCTImage', react_native_version #:path => '../times-components/node_modules/react-native/Libraries/Image'
   s.dependency 'React-RCTLinking', react_native_version #:path => '../times-components/node_modules/react-native/Libraries/LinkingIOS'
   s.dependency 'React-RCTNetwork', react_native_version #:path => '../times-components/node_modules/react-native/Libraries/Network'
   s.dependency 'React-RCTSettings', react_native_version #:path => '../times-components/node_modules/react-native/Libraries/Settings'
   s.dependency 'React-RCTText', react_native_version #:path => '../times-components/node_modules/react-native/Libraries/Text'
   s.dependency 'React-RCTVibration', react_native_version #:path => '../times-components/node_modules/react-native/Libraries/Vibration'
   s.dependency 'React-Core/RCTWebSocket', react_native_version #:path => '../times-components/node_modules/react-native/'
   s.dependency 'React-ART', react_native_version #:path => '../times-components/node_modules/react-native/Libraries/ART'
   s.dependency 'React-cxxreact', react_native_version #:path => '../times-components/node_modules/react-native/ReactCommon/cxxreact'
   s.dependency 'React-jsi', react_native_version #:path => '../times-components/node_modules/react-native/ReactCommon/jsi'
   s.dependency 'React-jsiexecutor', react_native_version #:path => '../times-components/node_modules/react-native/ReactCommon/jsiexecutor'
   s.dependency 'React-jsinspector', react_native_version #:path => '../times-components/node_modules/react-native/ReactCommon/jsinspector'

   s.dependency 'ReactCommon/jscallinvoker', react_native_version #:path => '../times-components/node_modules/react-native/ReactCommon'
   s.dependency 'ReactCommon/turbomodule/core', react_native_version #:path => '../times-components/node_modules/react-native/ReactCommon'
   s.dependency 'react-native-webview', react_native_version #:path => '../times-components/node_modules/react-native-webview'

   s.dependency 'Yoga', '1.14.0'
  # React's Dependencies
  react_podspecs = [
    'node_modules/react-native/third-party-podspecs/DoubleConversion.podspec',
    'node_modules/react-native/third-party-podspecs/Folly.podspec',
    'node_modules/react-native/third-party-podspecs/glog.podspec'
  ]

  # Native dependencies if any, which come from node_modules
  dep_podspecs = [
    'node_modules/react-native-webview/react-native-webview.podspec'
  ]

  # Ties the exact versions so host apps don't need to guess the version
  # or have a potential mismatch
  podspecs = react_podspecs + dep_podspecs
  podspecs.each do |podspec_path|
    spec = Pod::Specification.from_file podspec_path
    s.dependency spec.name, "#{spec.version}"
  end
end
