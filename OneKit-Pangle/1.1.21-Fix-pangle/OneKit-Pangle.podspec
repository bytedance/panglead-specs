Pod::Spec.new do |s|
    s.name             = 'OneKit-Pangle'
    s.version          = '1.1.21-Fix-pangle'
    s.summary          = 'OneSDK Kit.'
    s.description      = 'an iOS base Framework.'
    s.homepage         = "https://github.com/bytedance/panglead-specs/OneKit"
    s.license          = {
      :type => 'Copyright',
      :text => <<-LICENSE
                Bytedance copyright
      LICENSE
    }
    s.author           = { 'chenyi' => 'chenyi.0@bytedance.com' }
    s.source           = { :http => "https://sf16-fe-tos-sg.i18n-pglstatp.com/obj/pangle-sdk-static-va/OneKit/1.1.21-Fix/OneKit-Pangle.zip" }
    s.ios.deployment_target = '9.0'
    s.requires_arc = true
    s.static_framework = true
    s.pod_target_xcconfig = {
      'DEFINES_MODULE' => 'YES',
      'BITCODE_GENERATION_MODE' => 'bitcode',
    }
  
    s.subspec 'BaseKit' do |d|
      d.frameworks =  'Foundation'
      d.library = 'z'
      d.source_files = 'OneKit-Pangle/BaseKit/**/*.{h,m}'
      d.public_header_files = 'OneKit-Pangle/BaseKit/**/*.h'
      d.vendored_library = 'OneKit-Pangle/BaseKit/**/*.a'
    end
  
    s.subspec 'BDMantle' do |d|
      d.frameworks =  'Foundation'
      d.source_files = 'OneKit-Pangle/BDMantle/**/*.h'
      d.public_header_files = 'OneKit-Pangle/BDMantle/**/*.h'
      d.vendored_library = 'OneKit-Pangle/BDMantle/**/*.a'
    end
  
    # for TTNet
    s.subspec 'boringssl' do |d|
      d.vendored_libraries = [
        "OneKit-Pangle/boringssl/libcrcrypto.a",
        "OneKit-Pangle/boringssl/libboringssl.a",
        "OneKit-Pangle/boringssl/libboringssl_asm.a"
      ]
      d.libraries = "boringssl","crcrypto","boringssl_asm"
      d.xcconfig = {
        # 'USE_HEADERMAP' => 'NO',
        'HEADER_SEARCH_PATHS' => '$(inherited) "${PODS_ROOT}/OneKit-Pangle/boringssl/include"',
        # 'ALWAYS_SEARCH_USER_PATHS' => 'NO'
      }
    end
  
    s.subspec 'ByteDanceKit' do |d|
      d.subspec 'Foundation' do |foundation|
        foundation.frameworks = 'Foundation'
        foundation.source_files = ['OneKit-Pangle/ByteDanceKit/Foundation/*.h']
        foundation.public_header_files = ['OneKit-Pangle/ByteDanceKit/Foundation/*.h']
        foundation.vendored_library = 'OneKit-Pangle/ByteDanceKit/Foundation/*.a'
      end
      d.subspec 'UIKit' do |uikit|
        uikit.dependency 'OneKit-Pangle/ByteDanceKit/Foundation'
        uikit.frameworks = 'UIKit','QuartzCore','Accelerate','CoreTelephony'
        uikit.vendored_library = 'OneKit-Pangle/ByteDanceKit/UIKit/*.a'
        uikit.source_files = 'OneKit-Pangle/ByteDanceKit/UIKit/*.h'
        uikit.public_header_files = 'OneKit-Pangle/ByteDanceKit/UIKit/*.h'
      end
    end
  
    s.subspec 'Database' do |d|
      d.frameworks =  'Foundation'
      d.library = 'sqlite3'
      d.dependency 'OneKit-Pangle/Service'
      d.source_files = 'OneKit-Pangle/Database/*.h'
      d.public_header_files = 'OneKit-Pangle/Database/*.h'
      d.vendored_library = 'OneKit-Pangle/Database/*.a'
    end
  
    s.subspec 'Defaults' do |d|
      d.dependency 'OneKit-Pangle/BaseKit'
      d.frameworks =  'Foundation'
      d.source_files = 'OneKit-Pangle/Defaults/*.h'
      d.public_header_files = 'OneKit-Pangle/Defaults/*.h'
      d.vendored_library = 'OneKit-Pangle/Defaults/*.a'
    end
  
    s.subspec 'IDFA' do |d|
      d.frameworks =  'AdSupport'
      d.dependency 'OneKit-Pangle/Service'
      d.dependency 'OneKit-Pangle/StartUp'
      d.source_files = 'OneKit-Pangle/IDFA/*.h'
      d.public_header_files = 'OneKit-Pangle/IDFA/*.h'
      d.vendored_library = 'OneKit-Pangle/IDFA/*.a'
    end
  
    s.subspec 'MARS' do |d|
      d.frameworks =  'Foundation'
      d.dependency 'OneKit-Pangle/BaseKit'
      d.subspec 'Auth' do |auth|
        auth.source_files = 'OneKit-Pangle/MARS/Auth/*.h'
        auth.public_header_files = 'OneKit-Pangle/MARS/Auth/*.h'
        auth.vendored_library = 'OneKit-Pangle/MARS/Auth/*.a'
        auth.dependency 'OneKit-Pangle/BaseKit'
        auth.dependency 'OneKit-Pangle/StartUp'
      end
    end
  
    s.subspec 'Reachability' do |d|
      d.frameworks =  'Foundation', 'CoreTelephony', 'SystemConfiguration', 'CoreFoundation', 'UIKit'
      d.source_files = 'OneKit-Pangle/Reachability/*.h'
      d.public_header_files = 'OneKit-Pangle/Reachability/*.h'
      d.vendored_library = 'OneKit-Pangle/Reachability/*.a'
    end
  
    s.subspec 'Screenshot' do |d|
      d.frameworks =  'Foundation'
      d.source_files = 'OneKit-Pangle/Screenshot/*.h'
      d.public_header_files = 'OneKit-Pangle/Screenshot/*.h'
      d.vendored_library = 'OneKit-Pangle/Screenshot/*.a'
    end
  
    s.subspec 'Service' do |d|
      d.frameworks =  'Foundation'
      d.source_files = 'OneKit-Pangle/Service/*.h'
      d.public_header_files = 'OneKit-Pangle/Service/*.h'
      d.vendored_library = 'OneKit-Pangle/Service/*.a'
    end
  
    s.subspec 'StartUp' do |d|
      d.frameworks =  'Foundation'
      d.dependency 'OneKit-Pangle/BaseKit'
      d.dependency 'OneKit-Pangle/Reachability'
      d.source_files = 'OneKit-Pangle/StartUp/**/*.h'
      d.public_header_files = 'OneKit-Pangle/StartUp/**/*.h'
      d.vendored_library = 'OneKit-Pangle/StartUp/*.a'
    end
  
  end
