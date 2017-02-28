Pod::Spec.new do |s|
  s.name         = 'ZKSforce'
  s.version      = '38.0.2.2'
  s.summary      = 'A Cocoa library for calling the Salesforce.com SOAP APIs.'
  s.homepage     = 'https://github.com/superfell/zkSforce'
  s.license      = 'MIT'
  s.author       = { "Simon Fell" => "fellforce@gmail.com" }
  s.source       = { git: 'https://github.com/pilot34/zkSforce.git', tag: "v38.0.2.2" }
  s.platform     = :ios, '8.0'
  s.requires_arc = false

  s.subspec 'Libxml2' do |l|
    l.library = 'xml2'
    l.module_name = 'Libxml2'
    l.preserve_paths = 'modulemaps/**/*'
    l.xcconfig = { 'HEADER_SEARCH_PATHS' => '$(SDKROOT)/usr/include/libxml2' }
    l.pod_target_xcconfig = {
        'SWIFT_INCLUDE_PATHS[sdk=macosx*]'           => '$(PODS_ROOT)/ZKSforce/modulemaps/macosx',
        'SWIFT_INCLUDE_PATHS[sdk=iphoneos*]'         => '$(PODS_ROOT)/ZKSforce/modulemaps/iphoneos',
        'SWIFT_INCLUDE_PATHS[sdk=iphonesimulator*]'  => '$(PODS_ROOT)/ZKSforce/modulemaps/iphonesimulator',
    }
  end

  s.subspec 'ZKSforce' do |z|
    z.source_files = 'zkSforce'
    z.module_name = 'ZKSforce'
    z.public_header_files = 'zkSforce/*.h'
    z.dependency 'ZKSforce/Libxml2'
    z.osx.frameworks = 'Security'
    z.xcconfig = { 'HEADER_SEARCH_PATHS' => '$(SDKROOT)/usr/include/libxml2' }
  end
end