#
# Be sure to run `pod lib lint MPGridView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MPGridView'
  s.version          = '1.0.0'
  s.summary          = 'Container for laying out a set of views horizontally or vertically.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  Container for laying out a set of views horizontally or vertically in different ways
                       DESC

  s.homepage         = 'https://github.com/maxim-pervushin/MPGridView'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Maxim Pervushin' => 'maxim.pervushin@gmail.com' }
  s.source           = { :git => 'https://github.com/maxim-pervushin/MPGridView.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'
  s.swift_version = '4.0'

  s.source_files = 'MPGridView/Classes/**/*'
  
  # s.resource_bundles = {
  #   'MPGridView' => ['MPGridView/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
