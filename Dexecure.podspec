
Pod::Spec.new do |spec|

  spec.name         = "Dexecure"
  spec.version      = "0.0.1"
  spec.summary      = "Dexecure is a real-time image processing service and CDN."
  spec.description  = <<-DESC
  Dexecure is a real-time image processing service and CDN. It lets you edit images on the fly by changing their URL query string parameters. That means you can crop and resize images without having to batch process them or store derivative versions.
                   DESC

  spec.homepage     = "https://github.com/Dexecure/iOS-sdk"
  spec.license      = { :type => "MIT", :file => "LICENSE" }

  spec.author             = { "Dexecure" => "imsaurabhmahajan@gmail.com" }
  spec.ios.deployment_target = "10.0"
  spec.swift_version = "4.2"
  spec.source       = { :git => "https://github.com/Dexecure/iOS-sdk.git", :tag => "#{spec.version}" }

  spec.source_files  =  "Dexecure/**/*.{h,m,swift}"

end
