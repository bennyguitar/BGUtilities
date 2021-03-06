Pod::Spec.new do |s|
  s.name         = 'BGUtilities'
  s.version      = '1.5.0'
  s.summary      = 'A collection of categories and class methods to make your iOS life easier.'
  s.author = {
    'Ben Gordon' => 'brgordon@ua.edu'
  }
  s.source = {
    :git => 'https://github.com/bennyguitar/BGUtilities.git',
    :tag => s.version
  }
  s.homepage    = 'https://github.com/bennyguitar'
  s.license     = 'LICENSE'
  s.source_files = 'Classes/*.{h,m}'
  s.ios.deployment_target = '6.0'
  s.requires_arc = true
  s.dependency 'Colours'
end