Pod::Spec.new do |spec|

  spec.name         = "MiLibrisReaderSDK"
  spec.version      = "1.1.0"

  spec.summary      = "miLibris iOS Reader SDK"
  spec.description  = <<-DESC
                      MiLibrisReaderSDK is the new miLibris reading SDK (previously called MLPDFReaderSDK). It includes the MLFoundation library allowing to unpack miLibris contents.
                   DESC

  spec.homepage     = "https://github.com/miLibris/ios-milibris-reader-sdk"
  spec.license      = { :type => 'Copyright', :text => 'Copyright miLibris 2022' }
  spec.author       = { "miLibris" => "support@milibris.com" }

  spec.cocoapods_version = '>= 1.9'

  spec.ios.deployment_target = "11.0"

  spec.source = {
    :http => "https://github.com/miLibris/ios-milibris-reader-sdk/releases/download/v#{spec.version}/MiLibrisReaderSDK.xcframework.zip",
    :type => "zip",
    :sha256 => 'c2da9691a196ca0b8b5fc19802042b471571d6832ebe3a47c63ab90d766d4bd8'
  }

  spec.vendored_frameworks = 'MiLibrisReaderSDK.xcframework'

end
