Pod::Spec.new do |spec|

  spec.name         = "IOSKELETON_LOGIN"
  spec.version      = "0.0.2"
  spec.summary      = "New project"
  spec.ios.deployment_target = '14.0'
  spec.swift_version = "5.1"
  spec.description  = <<-DESC
    A standard normal description but short
                   DESC

  spec.homepage     = "https://github.com/headStyleColorRed/IOSKELETON_LOGIN"
  spec.license      = "MIT"
  spec.author             = { "Rodrigo Labrador" => "headstylecolorred@gmail.com" }
  spec.source       = { :git => "https://github.com/headStyleColorRed/IOSKELETON_LOGIN.git", :tag => "#{spec.version}" }
  spec.source_files  = "IOSKELETON_LOGIN", "IOSKELETON_LOGIN/**/*.{swift}"
  spec.resources = "#{spec.name}/**/*.{xcassets,imageset,json}"
  
  

end
