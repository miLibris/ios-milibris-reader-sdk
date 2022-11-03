//
//  ViewController.swift
//  OneReaderSampleApp
//
//  Created by Maxime Le Moine on 17/11/2020.
//

import MiLibrisReaderSDK
import UIKit

final class ViewController: UIViewController {

    let releasePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        .appendingPathComponent("sample")

    override func viewDidLoad() {
        super.viewDidLoad()

        // Get the local URL of the .complete file
        // It is usually downloaded from the miLibris platform
        // In this sample, it is included in the app bundle
        guard let archivePath = Bundle.main.url(forResource: "sample", withExtension: "complete") else {
            fatalError("sample.complete not found in bundle")
        }

        // Unpack .complete
        // This operation can be performed after downloading the .complete
        try? FileManager.default.removeItem(at: releasePath)
        do {
            try MLArchive.extract(archivePath, inDirectory: releasePath)
        } catch {
            // This error should be handled by the app: corrupted file, not enough space left on storage, etc.
            print("Error unpacking archive: \(error)")
        }

        // Customize logging (optional)
        //Logger.minLogLevel = .debug
        //Logger.shared = MyLogger.self

        // Reset the tutorial so that it will be displayed on the next opening.
        // Only use this for testing purposes or if you have a feature that resets tutorials in your app.
        MiLibrisReaderTutorialProvider().resetTutorial()
    }

    @IBOutlet private weak var coverImageView: UIImageView?

    private var lastSelectedPage: Int?

    @IBAction private func openReader() {
        print("Open reader")

        // Instantiate a miLibris datasource for your release
        let datasource = XmlpdfDatasource(releasePath: releasePath, articlesLanguageCode: .frFR)

        // Instantiate the reader
        let reader = Reader(datasource: datasource)

        // Open the reader to a specific page (optional)
        reader.initialPageNumber = lastSelectedPage ?? 1

        // Register a delegate (optional). It can be used to:
        // - Improve the reader experience (imageViewForReaderPresentation...)
        // - Track events in the reader to integrate with your Analytics solution
        reader.delegate = self

        // Add your branding to the reader (optional)
        /*reader.config.applyBranding(
            mainTintColor: .red,
            mainTintColorComplement: .white,
            logoImage: UIImage(named: "myLogo"),
            logoBackgroundColor: .white
        )*/

        // Customize the reader (optional)
        //reader.config.colors.background = .red
        //reader.config.articleReader.features.isTextToSpeechEnabled = false

        // Apply the same changes to all navigation bars (optional)
        //reader.config.navigationBar.applyMyConfig()
        //reader.config.summary.navigationBar.applyMyConfig()
        //reader.config.articleReader.navigationBar.applyMyConfig()
        //reader.config.articleReader.summary.navigationBar.applyMyConfig()

        // Disable the tutorial that is displayed the first time the reader is opened on a new device (optional)
        //reader.readerTutorialProvider = nil

        // Integrate with your article bookmarking system (optional)
        reader.bookmarkProvider = MyBookmarkProvider()

        // Add article sharing to your website... (optional)
        reader.sharingProvider = MyWebsiteSharingProvider()

        // ... or add article sharing to a miLibris kiosk with the sharing option enabled (optional)
        let issueId = "milibris-issue-id" // the MID of the issue being opened, as returned by the miLibris API
        reader.sharingProvider = MyMiLibrisSharingProvider(issueId: issueId)

        // Present it
        reader.presentReaderViewController(from: self)
    }

}

extension ViewController: ReaderDelegate {

    var imageViewForReaderPresentation: UIImageView? {
        // Provide an image view that is displaying the cover of the issue.
        // It will be used for open and close transitions.
        // If you return nil, a default cover transition will be used.
        return coverImageView
    }

    func readerViewController(_ readerViewController: UIViewController, didMoveToPageNumbers pageNumbers: [Int]) {
        print("Did move to page numbers \(pageNumbers)")
        lastSelectedPage = pageNumbers.first
    }

    func articleReaderViewController(
        _ articleReaderViewController: UIViewController, didOpenArticle article: ArticlePreview
    ) {
        print("Did open article \(article.articleId): \(article.title)")
    }

    func didPresentReaderViewController(_ readerViewController: UIViewController) {
        print("Did open reader")
    }

    func didDismissReaderViewController(_ readerViewController: UIViewController) {
        print("Did close reader")
        // Here you can persist lastSelectedPage for later use
    }

    func readerViewController(_ readerViewController: UIViewController, willShowProduct product: Product) {
        print("Will show product: \(product)")
    }

    func readerViewControllerDidReachLastPage(_ readerViewController: UIViewController) {
        print("Did move to last page")
    }

    func readerViewControllerDidPresentSummary(_ readerViewController: UIViewController) {
        print("Did present summary from pages")
    }

    func readerViewControllerDidPresentMiniSummary(_ readerViewController: UIViewController) {
        print("Did present mini summmary")
    }

    func articleReaderViewController(
        _ articleReaderViewController: UIViewController, didCloseArticle article: ArticlePreview
    ) {
        print("Did close article \(article.title)")
    }

    func articleReaderViewControllerDidPresentSummary(_ articleReaderViewController: UIViewController) {
        print("Did present summary from articles")
    }

    func articleReaderViewControllerDidReachLastArticle(_ articleReaderViewController: UIViewController) {
        print("Did reach last article")
    }

    func readerViewControllerDidAppear(_ readerViewController: UIViewController) {
        print("Reader did appear")
    }

    func readerViewControllerWillDisappear(_ readerViewController: UIViewController) {
        print("Reader will disappear")
    }

    func articleReaderViewController(
        _ articleReaderViewController: UIViewController, didEnableTextToSpeechForArticle article: ArticlePreview
    ) {
        print("Did enable text-to-speech for article \(article.title)")
    }

    func articleReaderViewController(
        _ articleReaderViewController: UIViewController, didDisableTextToSpeechForArticle article: ArticlePreview
    ) {
        print("Did disable text-to-speech for article \(article.title)")
    }

    func readerViewController(
        _ readerViewController: UIViewController, didOpenExternalLinkBoxWithContentURL contentURL: URL
    ) {
        print("Did open external link box: \(contentURL)")
    }

    func readerViewController(
        _ readerViewController: UIViewController, didOpenInternalLinkBoxWithPageNumber pageNumber: Int
    ) {
        print("Did open internal link box: \(pageNumber)")
    }

    func readerViewController(
        _ readerViewController: UIViewController, didOpenHtmlBoxWithAsset asset: HtmlBoxAsset
    ) {
        print("Did open HTML box: \(asset)")
    }

    func readerViewController(
        _ readerViewController: UIViewController & ArticleReaderDelegate,
        shouldDisplayArticle article: ArticlePreview
    ) -> Bool {
        return true

        // From here you could present your own article reader
        /*let myArticleViewController = MyArticleViewController()
        myArticleViewController.article = article
        myArticleViewController.delegate = readerViewController
        readerViewController.present(myArticleViewController, animated: true)
        return false*/
    }

}

extension NavigationBarConfig {

    mutating func applyMyConfig() {
        colors.titleText = .blue
        fonts.title = .custom(UIFont(name: "myfont", size: 12))
    }

}
