Pod::Spec.new do |spec|

  spec.name         = "MiLibrisReaderSDK"
  spec.version      = "1.11.1"

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
    :sha256 => 'f719e06d62be0683eabbc66779814ca300272016592e7dc9c65a8b1e4afeacdf'
  }

  spec.vendored_frameworks = 'MiLibrisReaderSDK.xcframework'

end
