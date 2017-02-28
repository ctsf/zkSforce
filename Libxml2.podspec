Pod::Spec.new do |s|
    s.name         = 'Libxml2'
    s.version      = '38.0.2.2'
    s.summary      = 'libxml wrapper'
    s.homepage     = 'https://github.com/pilot34/zkSforce'
    s.license      = 'MIT'
    s.author       = { "gtarasov" => "gleb34@gmail.com" }
    s.source       = { git: 'https://github.com/pilot34/zkSforce.git', tag: "v38.0.2.2" }
    s.platform     = :ios, '8.0'

    s.libraries = 'xml2'
    s.preserve_paths = 'modulemaps/**/*'
    s.xcconfig = { 'HEADER_SEARCH_PATHS' => '$(SDKROOT)/usr/include/libxml2' }
    s.pod_target_xcconfig = {
        'MODULEMAP_FILE[sdk=macosx*]'           => '$(PODS_ROOT)/Libxml2/modulemaps/macosx',
        'MODULEMAP_FILE[sdk=iphoneos*]'         => '$(PODS_ROOT)/Libxml2/modulemaps/iphoneos',
        'MODULEMAP_FILE[sdk=iphonesimulator*]'  => '$(PODS_ROOT)/Libxml2/modulemaps/iphonesimulator',
    }
    s.source_files = 'Libxml2-dummy-source.m'
end