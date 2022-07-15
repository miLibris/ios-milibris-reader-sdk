# MiLibrisReaderSDK

MiLibrisReaderSDK is the new miLibris reading SDK (previously called MLPDFReaderSDK). It includes the MLFoundation library allowing to unpack miLibris contents.

## Setup

### Prerequisites

MiLibrisReaderSDK requires iOS 11 or later, Xcode 13 or later. The SDK is provided as a dynamic XCFramework.

Every app using the SDK must be configured with a licence key provided by miLibris. A licence key cannot be used in more than one application.

- In your Xcode project, open your main target *Info.plist*
- Add a new key named *MiLibrisReaderSDKLicenceKey* of type *String*.
- In the value field, add the licence key provided by miLibris.

### Manual installation

- Download and unzip the SDK from the latest release: https://github.com/miLibris/ios-milibris-reader-sdk/releases/latest
- Move *MiLibrisReaderSDK.xcframework* in your project directory.
- Add *MiLibrisReaderSDK.xcframework* into your project's *Embedded Content* section in the project editor.

#### Sample app

An example of an Xcode project with manual integration is available in this repository. To use it:

- Download and unzip the SDK from the latest release: https://github.com/miLibris/ios-milibris-reader-sdk/releases/latest
- Move *MiLibrisReaderSDK.xcframework* in *sample_manual*.
- Open *sample_manual/MiLibrisReaderSDKSample.xcodeproj*
