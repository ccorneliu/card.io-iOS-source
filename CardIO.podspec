Pod::Spec.new do |spec|
  spec.name             = 'CardIO'
  spec.version          = '5.4.2'
  spec.license          = { type: 'MIT', file: 'LICENSE.md' }
  spec.homepage         = 'https://www.card.io'
  spec.authors          = { 'CardIO' => 'support@paypal.com' }
  spec.summary          = 'Credit card scanning for mobile apps'
  spec.source           = { :git => 'https://github.com/card-io/card.io-iOS-SDK.git', :tag => "#{spec.version}" }
  spec.platform         = :ios, '6.1'
  spec.ios.deployment_target = '6.1'
  spec.requires_arc     = true
  spec.source_files     = 'Classes/*.{m,mm}', 'CardIOCardholderNameTextFieldDelegate.m', 'CardIO_Public_API/*.h', 'Classes/*.h', 'CardIOCardholderNameTextFieldDelegate.h'
  spec.frameworks       = 'Accelerate', 'AVFoundation', 'AudioToolbox', 'CoreMedia', 'CoreVideo', 'MobileCoreServices', 'OpenGLES', 'QuartzCore', 'Security', 'UIKit'
  spec.libraries        = 'c++'
  # spec.public_header_files = 'CardIO_Public_API/*.h', 'Classes/*.h', 'CardIOCardholderNameTextFieldDelegate.h'

  spec.subspec 'dmz' do |sp|
    sp.source_files = 'dmz/dmz_all.cpp'
    sp.compiler_flags = '-O3 -fslp-vectorize-aggressive'
  end

  spec.subspec 'dmz-other' do |sp|
    sp.header_mappings_dir = 'dmz'
    sp.public_header_files = 'dmz/**/*.{h,hpp}', 'dmz/Eigen/*'
    sp.source_files = 'dmz/**/**/*.{m,cpp,mm}'
    # sp.source_files = 'dmz/mz_ios.mm', 'dmz/dmz.h'
  end

  spec.subspec 'opencv_device' do |sp|
    sp.header_mappings_dir = 'opencv_device'
    sp.public_header_files = 'opencv_device/**/*.{h,hpp}',
    sp.source_files = 'opencv_device/**/*.{m,cpp,mm}'
    # sp.source_files = 'dmz/mz_ios.mm', 'dmz/dmz.h'
  end
end
