Pod::Spec.new do |s|
  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.name = 'OAuthRxSwift'
  s.version = '0.0.1'
  s.license = 'MIT'
  s.summary = 'OAuthSwift & RxSwift'

  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.license      = "MIT"

  s.homepage = 'https://github.com/OAuthSwift/OAuthRxSwift'
  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.author             = { "phimage" => "eric.marchand.n7@gmail.com" }

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.ios.deployment_target = '9.0'
  s.osx.deployment_target = '10.11'

  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.source = { :git => 'https://github.com/OAuthSwift/OAuthRxSwift.git', :tag => s.version }

  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.source_files = 'Sources/*.swift'

  s.dependency 'OAuthSwift'
  s.dependency 'RxSwift'

end
