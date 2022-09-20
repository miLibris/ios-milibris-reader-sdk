Pod::Spec.new do |spec|

  spec.name         = "MiLibrisReaderSDK"
  spec.version      = "0.3.1"

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
    :sha256 => 'd3f5fd7c5cd284a38fe0436c22922e1e7a00d36619990ea31b8af2c58acbc4c3'
  }

  spec.vendored_frameworks = 'MiLibrisReaderSDK.xcframework'

end
