# MiLibrisReaderSDK

MiLibrisReaderSDK is the new miLibris reading SDK (previously called MLPDFReaderSDK). It includes the MLFoundation library which allows unpacking miLibris contents.

[CHANGELOG](./CHANGELOG.md)

* [Issues](#issues)
* [Setup](#setup)
    * [Prerequisites](#prerequisites)
    * [Installation via Swift Package Manager](#installation-via-swift-package-manager)
    * [Installation via CocoaPods](#installation-via-cocoapods)
    * [Installation via Carthage](#installation-via-carthage)
    * [Manual installation](#manual-installation)
    * [Migrating from MiLibrisReaderSDK v0](#migrating-from-milibrisreadersdk-v0)
    * [Migrating from MLPDFReaderSDK v1](#migrating-from-mlpdfreadersdk-v1)
* [Implementation](#implementation)
    * [Usual workflow](#usual-workflow)
    * [Download a complete archive](#download-a-complete-archive)
    * [Extract a complete archive](#extract-a-complete-archive)
    * [Open the reader](#open-the-reader)
* [Optional features](#optional-features)
    * [Configure the reader tutorial](#configure-the-reader-tutorial)
    * [Provide an image view for transitions](#provide-an-image-view-for-transitions)
    * [Resume reading at the last read page](#resume-reading-at-the-last-read-page)
    * [Apply your branding to the reader UI](#apply-your-branding-to-the-reader-ui)
    * [Support dark mode](#support-dark-mode)
    * [Integrate with your analytics solution](#integrate-with-your-analytics-solution)
    * [Provide article sharing functionality](#provide-article-sharing-functionality)
    * [Provide article bookmark functionality](#provide-article-bookmark-functionality)
    * [Customize logging](#customize-logging)
    * [Present your own article reader](#present-your-own-article-reader)
    * [Add a print button](#add-a-print-button)
    * [Enable background mode for text-to-speech](#enable-background-mode-for-text-to-speech)
    * [Configure article search](#configure-article-search)
    * [Disable image crop in articles](#disable-image-crop-in-articles)
    * [Customize article reader fonts](#customize-article-reader-fonts)

## Issues

Please only open an issue if it concerns the usage of the reader SDK. For any other issue regarding the miLibris platform or API, contact miLibris support.

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

### Installation via CocoaPods

Requires CocoaPods >= 1.9

- Add the following line in your *Podfile*:

`pod 'MiLibrisReaderSDK', '~> 1.0'`

- Run `pod install`

#### Sample app

An example of an Xcode project with CocoaPods integration is available in this repository. To use it:

- In the *sample_cocoapods* directory, run `pod install`
- Open *sample_cocoapods/MiLibrisReaderSDKSample.xcworkspace*

### Installation via Carthage

Requires Carthage >= 0.38

- Add the following line in your *Cartfile*:

`binary "https://raw.githubusercontent.com/miLibris/ios-milibris-reader-sdk/main/MiLibrisReaderSDK.json" ~> 1.0`

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

### Migrating from MiLibrisReaderSDK v0

If using Swift Package Manager:

- In your Xcode project, navigate to the project editor > your project > Package Dependencies
- Double-click on the `ios-milibris-reader-sdk` package
- Edit the version rule to *Up to Next Major 1.0.0 < 2.0.0*

If using CocoaPods:

- Update your Podfile with the following line:

`pod 'MiLibrisReaderSDK', '~> 1.0'`

- Run `pod update MiLibrisReaderSDK`

If using Carthage:

- Update your Cartfile with the following line:

`binary "https://raw.githubusercontent.com/miLibris/ios-milibris-reader-sdk/main/MiLibrisReaderSDK.json" ~> 1.0`

- In the project directory, run `carthage update --use-xcframeworks`

### Migrating from MLPDFReaderSDK v1

- First remove the previous SDK from your project, depending on your installation method:
    - Swift Package Manager: in your Xcode project editor, select your project, then select the tab "Package dependencies", then delete the package "MLPDFReaderSDK"
    - CocoaPods: in your Podfile, remove the line `pod 'MLPDFReaderSDK'`, then run `pod install`
    - Carthage: in your Cartfile, remove the line with `MLPDFReaderSDK`, then run `carthage update`, then remove references to the framework in your Xcode project
    - Manual installation: delete *MLPDFReaderSDK.xcframework* from your project directory, then remove references to the framework in your Xcode project

- Follow the instructions in the previous sections to install the new SDK.
- In your Swift code, replace `import MLPDFReaderSDK` with `import MiLibrisReaderSDK`.
- Follow the instructions in the next sections to migrate your code to use the new SDK.

## Implementation

⚠️ The SDK is written in Swift and is not usable from Objective-C files.

The sample projects contain working examples of the following steps.

### Usual workflow

In order to read content with the SDK, your application will likely implement the following steps:

- Download a complete archive (with the *.complete extension) from the miLibris platform
- Extract the archive to a directory in the app storage
- Open the reader to read the unpacked content

### Download a complete archive

Refer to the miLibris API documentation to obtain a ticket for the issue you want to download, in the `x-ml-pdf` format.

You can then download the complete archive with the following URL: `https://content.milibris.com/access/%@/download.complete` (replace `%@` with the mid of your ticket).

The JWT token returned by the API can be ignored.

### Extract a complete archive

A complete archive can be unpacked with the MLArchive class. This can be done as a post-download step:

```swift
import MiLibrisReaderSDK

do {
    // archiveURL: the file URL to the .complete file that was downloaded from the miLibris platform
    // releaseURL: a file URL to an available directory where the content of the archive will be extracted
    try MLArchive.extract(archiveURL, inDirectory: releaseURL)
} catch {
    // something went wrong: maybe there is no archive at archiveURL, maybe the releaseURL directory cannot be written...
    print("Error when unpacking content: \(error)")
}
```

### Open the reader

Once an archive has been downloaded and extracted, it can be opened with a few lines of code:

```swift
import MiLibrisReaderSDK

class MyViewController: UIViewController {

    func openReader() {
        // Instantiate the reader
        let reader = Reader(releasePath: releasePath, articlesLanguageCode: .frFR)

        // Present it from a view controller of your app
        reader.presentReaderViewController(from: self)
    }

}
```

## Optional features

### Configure the reader tutorial

The reader is configured to display a tutorial the first time that it is opened on a new device. You can disable it you want:

```swift
import MiLibrisReaderSDK

class MyViewController: UIViewController, ReaderDelegate {

    func openReader() {
        // [...]

        // Set this before presenting the reader
        reader.readerTutorialProvider = nil

        // [...]
    }

}
```

For testing purposes or if you have a feature that resets tutorials in your app, you can add:

```swift
import MiLibrisReaderSDK

func resetTutorials() {
    MiLibrisReaderTutorialProvider().resetTutorial()
}

}
```

### Provide an image view for transitions

If you are already displaying the cover page of the issue to open in your UI, you can provide the image view to the reader in order to have nice transitions when opening or closing the reader. To do so, you must implement the reader delegate and return your image view:

```swift
import MiLibrisReaderSDK

class MyViewController: UIViewController, ReaderDelegate {

    func openReader() {
        // [...]

        // Set this before presenting the reader
        reader.delegate = self

        // [...]
    }

    // MARK: ReaderDelegate

    var imageViewForReaderPresentation: UIImageView? {
        // Provide an image view that is displaying the cover of the issue.
        // It will be used for open and close transitions.
        // If you return nil, a default cover transition will be used.
        return coverImageView
    }

}
```

### Resume reading at the last read page

When users close the reader and later open the same issue again, they might expect the reader to open at the last page that they consulted. You can implement this feature in two steps:

- Implement the reader delegate to save the last page consulted by a user
- Open the reader with the last consulted page

```swift
import MiLibrisReaderSDK

class MyViewController: UIViewController, ReaderDelegate {

    private var lastSelectedPage: Int?

    func openReader() {
        // [...]

        // Set this before presenting the reader
        reader.delegate = self
        reader.initialPageNumber = lastSelectedPage ?? 1

        // [...]
    }

    // MARK: ReaderDelegate

    func readerViewController(_ readerViewController: UIViewController, didMoveToPageNumbers pageNumbers: [Int]) {
        print("Did move to page numbers \(pageNumbers)")
        lastSelectedPage = pageNumbers.first
    }

    func didDismissReaderViewController(_ readerViewController: UIViewController) {
        // Here you can persist lastSelectedPage for later use
    }

}
```

### Apply your branding to the reader UI

Many components of the reader UI can be customized to match your brand. The SDK provides a method to quickly apply your brand color and logo:

```swift
import MiLibrisReaderSDK

class MyViewController: UIViewController {

    func openReader() {
        // [...]

        // Set this before presenting the reader
        reader.config.applyBranding(
            mainTintColor: .red,
            mainTintColorComplement: .white,
            logoImage: UIImage(named: "myLogo"),
            logoBackgroundColor: .white
        )

        // [...]
    }

}
```

You can also (or in addition to the previous method) individually customize every element of the UI. To do so, mutate the reader.config struct before opening the reader. The complete reference can be found in [Docs/config.md](./Docs/config.md#readerconfig). For example:

```swift
import MiLibrisReaderSDK

class MyViewController: UIViewController {

    func openReader() {
        // [...]

        // Set this before presenting the reader
        reader.config.colors.background = .red
        reader.config.articleReader.features.isTextToSpeechEnabled = false

        // Apply the same changes to all navigation bars
        reader.config.navigationBar.applyMyConfig()
        reader.config.summary.navigationBar.applyMyConfig()
        reader.config.articleReader.navigationBar.applyMyConfig()
        reader.config.articleReader.summary.navigationBar.applyMyConfig()

        // [...]
    }

}

extension NavigationBarConfig {

    mutating func applyMyConfig() {
        colors.titleText = .blue
        fonts.title = .custom(UIFont(name: "myfont", size: 12))
    }

}
```

### Support dark mode

If your application already supports dark mode, it will also be available in the reader.

If not, you can still make it available in the reader with a few steps:

- In your app's *Info.plist*, delete the line *UIUserInterfaceStyle* to opt in to dark mode support
- In the initialization code of the root view controller of your application, disable dark mode:

```swift
overrideUserInterfaceStyle = .light // disable dark mode
```

- Every time you present a view controller modally, disable dark mode on it:

```swift
viewControllerToPresent.overrideUserInterfaceStyle = .light // disable dark mode
present(viewControllerToPresent, animated: true)
```

### Integrate with your analytics solution

You can register a class as a delegate to the reader. This will allow you to receive various events from the reader, that you can then send to your analytics solution:

```swift
import MiLibrisReaderSDK

class MyViewController: UIViewController, ReaderDelegate {

    func openReader() {
        // [...]

        // Set this before presenting the reader
        reader.delegate = self

        // [...]
    }

    // MARK: ReaderDelegate

    func readerViewController(_ readerViewController: UIViewController, didMoveToPageNumbers pageNumbers: [Int]) {
        print("Did move to page numbers \(pageNumbers)")
    }

    func articleReaderViewController(
        _ articleReaderViewController: UIViewController, didOpenArticle article: ArticlePreview
    ) {
        print("Did open article \(article.articleId): \(article.title)")
    }

}
```

See the definition of `ReaderDelegate` for a complete list of events.

### Provide article sharing functionality

You can provide a sharing provider to the reader in order to add a "Share" button on articles. Your sharing provider is responsible for providing the content to share for an article.

```swift
import MiLibrisReaderSDK

class MyViewController: UIViewController {

    func openReader() {
        // [...]

        // Set this before presenting the reader
        reader.sharingProvider = MyWebsiteSharingProvider()

        // [...]
    }

}

class MyWebsiteSharingProvider: SharingProvider {

    func articleSharingContent(article: ArticlePreview) throws -> SharingContent {
        // You could use the miLibris article identifier or the article title to match with articles on your website
        let url = URL(string: "https://www.mywebsite.com/article/\(article.articleId)")!
        return SharingContent(url: url, title: article.title)
    }

}
```

The SDK also provides the implementation for sharing an article with a miLibris web kiosk.

⚠️ Before implementing this protocol, contact miLibris support to make sure that the sharing feature is supported by your web kiosk.

```swift
import MiLibrisReaderSDK

class MyViewController: UIViewController {

    func openReader() {
        // [...]

        // Set this before presenting the reader
        let issueId = "milibris-issue-id" // The MID of the issue being opened, as returned by the miLibris API
        reader.sharingProvider = MyMiLibrisSharingProvider(issueId: issueId)

        // [...]
    }

}

class MyMiLibrisSharingProvider: MiLibrisWebKioskSharingProvider {

    var kioskBaseURL: URL {
        return URL(string: "https://www.mywebkiosk.com")!
    }

    let issueId: String

    init(issueId: String) {
        self.issueId = issueId
    }

}
```

### Provide article bookmark functionality

You can provide a bookmark provider to the reader in order to add a "Bookmark" button on articles. Your bookmark provider is responsible for managing the on/off state of bookmarks.

The reader does not include a list of bookmarked articles. It should be developed in your app.

```swift
import MiLibrisReaderSDK

class MyViewController: UIViewController {

    func openReader() {
        // [...]

        // Set this before presenting the reader
        reader.bookmarkProvider = MyBookmarkProvider()

        // [...]
    }

}

class MyBookmarkProvider: BookmarkProvider {

    // In a typical application, this list is persisted somewhere
    var bookmarkedArticlesIds = Set<String>()

    // MARK: BookmarkProvider

    func isArticleBookmarked(_ article: ArticlePreview) -> Bool {
        return bookmarkedArticlesIds.contains(article.articleId)
    }

    func setIsArticleBookmarked(
        _ isBookmarked: Bool,
        article: ArticlePreview,
        from viewController: UIViewController,
        actionSource: BookmarkActionSource
    ) -> Bool {
        if isBookmarked {
            bookmarkedArticlesIds.insert(article.articleId)
            print("Added article to bookmarks: \(article.title)")
        } else {
            bookmarkedArticlesIds.remove(article.articleId)
            print("Removed article from bookmarks: \(article.title)")
        }

        // Return true if the operation was successful, false otherwise.
        return true
    }

}
```

### Customize logging

By default, the reader will print warnings and errors to the Xcode console. You can change the log level if you want to:

```swift
import MiLibrisReaderSDK

Logger.minLogLevel = .debug
```

You can also implement logging yourself, for example to plug the reader messages to your own logging solution:

```swift
import MiLibrisReaderSDK

Logger.shared = MyLogger.self

class MyLogger: LoggerType {

    static func log(_ message: String, file: String, function: String, line: Int, level: LogLevel) {
        print("[MYLOGGER] \(level.emoji) \(message)")
    }

}
```

### Present your own article reader

If you want to present your own article reader instead of the one provided by the SDK, you can do so using the reader delegate:

```swift
import MiLibrisReaderSDK

class MyViewController: UIViewController, ReaderDelegate {

    func openReader() {
        // [...]

        // Set this before presenting the reader
        reader.delegate = self

        // [...]
    }

    // MARK: ReaderDelegate

    func readerViewController(
        _ readerViewController: UIViewController & ArticleReaderDelegate,
        shouldDisplayArticle article: ArticlePreview
    ) -> Bool {
        let myArticleViewController = MyArticleViewController()
        myArticleViewController.article = article
        myArticleViewController.delegate = readerViewController
        readerViewController.present(myArticleViewController, animated: true)
        return false
    }

}

class MyArticleViewController: UIViewController {

    var article: ArticlePreview?

    weak var delegate: ArticleReaderDelegate?

}

```

### Add a print button

If you want to allow users to print a single page or a double page of your publication, you can do so by updating the config:

```swift
import MiLibrisReaderSDK

class MyViewController: UIViewController {

    func openReader() {
        // [...]

        // Set this before presenting the reader
        reader.config.features.printEnabled = true

        // [...]
    }

}
```

### Enable background mode for text-to-speech

If you want to allow the text-to-speech audio to continue while the app is in the background, you need to enable the `audio` background mode in your iOS project.

- Select your project in Xcode
- Open the "Signing & Capabilities" tab
- Enable "Background Modes" if needed
- Enable "Audio, AirPlay, and Picture in Picture"

### Configure article search

If you want to add a search interface for articles in the summary, you need to configure the miLibris API access with the same keys you use in your app:

```swift
import MiLibrisReaderSDK

class MyViewController: UIViewController, ReaderDelegate {

    func openReader() {
        // Instantiate the reader with the miLibris search API
        let searchProvider = MiLibrisSearchProvider(
            pointOfSaleMid: "<your_point_of_sale_mid>",
            basicAuth: "<your_basic_auth>",
            issueMid: "<issue_mid_being_opened>"
        )
        let reader = Reader(
            releasePath: releasePath, articlesLanguageCode: .frFR, searchProvider: searchProvider
        )

        // [...]
    }

}
```

### Disable image crop in articles

By default some images in articles are cropped to better fit the templates. If you want to disable all image cropping you can add the following configuration:

```swift
import MiLibrisReaderSDK

class MyViewController: UIViewController {

    func openReader() {
        // [...]

        // Set this before presenting the reader
        reader.config.articleReader.features.forceLayout = .default
        reader.config.articleReader.features.isImageCropEnabled = false

        // [...]
    }

}
```

### Customize article reader fonts

You can quickly customize the article reader fonts to match your brand:

```swift
import MiLibrisReaderSDK

class MyViewController: UIViewController {

    func openReader() {
        // [...]

        // Set this before presenting the reader
        try reader.config.articleReader.articleReader.applyPrimaryFont(
            regularFontName: "PlayfairDisplay-Regular",
            blackFontName: "PlayfairDisplay-Black",
            boldFontName: "PlayfairDisplay-Bold"
        )
        try reader.config.articleReader.applySecondaryFont(
            regularFontName: "ComicNeue-Regular",
            mediumFontName: "ComicNeue-Light",
            semiBoldFontName: "ComicNeue-Bold"
        )
        try reader.config.articleReader.applyTertiaryFont(
            regularFontName: "RobotoCondensed-Regular",
            blackFontName: "RobotoCondensed-Black",
            boldFontName: "RobotoCondensed-ExtraBold",
            italicFontName: "RobotoCondensed-Italic"
        )

        // [...]
    }

}
```

See the methods documentation in code for more info. In addition to this, you can also customize each UI component individually with the corresponding config properties.
