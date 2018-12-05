#
#  Be sure to run `pod spec lint ORouter.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "ORouter"
  s.version      = "0.0.1"
  s.summary      = "oc runtime router"
  s.description  = <<-DESC
                    oc runtime Router
                  DESC

  s.homepage     = "https://github.com/snice/ORouter"
  s.license      = { :type => "MIT" }
  s.author             = { "zhuzhe" => "zhuzheteng@gmail.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/snice/ORouter.git", :tag => "#{s.version}" }

  s.source_files  = "Classes", "Classes/**/*.{h,m}"
  s.exclude_files = "Classes/Exclude"
  s.public_header_files = "Classes/**/*.h"

end
