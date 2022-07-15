# MiLibrisReaderSDK

MiLibrisReaderSDK is the new miLibris reading SDK (previously called MLPDFReaderSDK). It includes the MLFoundation library allowing to unpack miLibris contents.

## Setup

### Prerequisites

MiLibrisReaderSDK requires iOS 11 or later, Xcode 13 or later. The SDK is provided as a dynamic XCFramework.

Every app using the SDK must be configured with a licence key provided by miLibris. A licence key cannot be used in more than one application.

- In your Xcode project, open your main target *Info.plist*
- Add a new key named *MiLibrisReaderSDKLicenceKey* of type *String*.
- In the value field, add the licence key provided by miLibris.

### Installation via Swift Package Manager

- In your Xcode project, select *File* > *Swift Packages* > *Add Package Dependency...*
- In the URL field, paste *https://github.com/miLibris/ios-milibris-reader-sdk.git* and select *Next*
- Select an update rule
- Add the product "MiLibrisReaderSDK" to your app target

#### Sample app

An example of an Xcode project with Swift Package Manager integration is available in this repository. To use it:

- Open *sample_swiftpackagemanager/MiLibrisReaderSDKSample.xcodeproj*

### Installation via CocoaPods (requires CocoaPods >= 1.9)

- Add the following line in your *Podfile*:

`pod 'MiLibrisReaderSDK', '~> 0.0'`

- Run `pod install`

#### Sample app

An example of an Xcode project with CocoaPods integration is available in this repository. To use it:

- In the *sample_cocoapods* directory, run `pod install`
- Open *sample_cocoapods/MiLibrisReaderSDKSample.xcworkspace*

### Installation via Carthage (requires Carthage >= 0.38.0)

- Add the following line in your *Cartfile*:

`binary "https://raw.githubusercontent.com/miLibris/ios-milibris-reader-sdk/main/MiLibrisReaderSDK.json" ~> 0.0`

- In the project directory, run `carthage update --use-xcframeworks`

#### Sample app

An example of an Xcode project with Carthage integration is available in this repository. To use it:

- In the *sample_carthage* directory, run `carthage update --use-xcframeworks`
- Open *sample_carthage/MiLibrisReaderSDKSample.xcodeproj*

### Manual installation

- Download and unzip the SDK from the latest release: https://github.com/miLibris/ios-milibris-reader-sdk/releases/latest
- Move *MiLibrisReaderSDK.xcframework* in your project directory.
- Add *MiLibrisReaderSDK.xcframework* into your project's *Embedded Content* section in the project editor.

#### Sample app

An example of an Xcode project with manual integration is available in this repository. To use it:

- Download and unzip the SDK from the latest release: https://github.com/miLibris/ios-milibris-reader-sdk/releases/latest
- Move *MiLibrisReaderSDK.xcframework* in *sample_manual*.
- Open *sample_manual/MiLibrisReaderSDKSample.xcodeproj*
