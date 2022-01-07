Pod::Spec.new do |s|
    s.name             = 'BUFederatedLearning'
    s.version          = '1.0.0.3'
    s.summary          = 'BUFederatedLearning Kit.'
    s.description      = 'an iOS FL Framework.'
    s.homepage         = "https://github.com/bytedance/panglead-specs/BUFederatedLearning"
    s.license          = {
      :type => 'Copyright',
      :text => <<-LICENSE
                Bytedance copyright
      LICENSE
    }
    s.author           = { 'chenzhuo' => 'chenzhuo.zy@bytedance.com' }
    s.source           = { :http => "https://sf16-fe-tos-sg.i18n-pglstatp.com/obj/pangle-sdk-static-va/BUFederatedLearning/4.2.5.1-3/BUFederatedLearning.zip" }
    s.ios.deployment_target = '9.0'
    s.requires_arc = true
    s.static_framework = true
    s.pod_target_xcconfig = {
      'DEFINES_MODULE' => 'YES',
      'BITCODE_GENERATION_MODE' => 'bitcode',
    }
    s.frameworks =  "UIKit", "CoreFoundation", "CoreML"
    s.library = 'z', 'bz2', 'resolv.9', 'c++', 'xml2'
    s.dependency 'Protobuf'
    s.dependency 'OneKit-Pangle/boringssl', '1.1.21-pangle'
    s.dependency 'SSZipArchive'
    s.vendored_frameworks = ['BUFederatedLearning/BUFederatedLearning.framework']
  
  end
