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

    }

    @IBOutlet private weak var coverImageView: UIImageView?

    @IBAction private func openReader() {
        print("Open reader")

        // Instantiate a miLibris datasource for your release
        let datasource = XmlpdfDatasource(releasePath: releasePath, articlesLanguageCode: .frFR)

        // Instantiate the reader
        let reader = Reader(datasource: datasource)

        // Register a delegate (optional). It can be used to:
        // - Improve the reader experience (imageViewForReaderPresentation...)
        // - Track events in the reader to integrate with your Analytics solution
        reader.delegate = self

        // Add your branding to the reader (optional)
        /*reader.config.applyBranding(
            mainTintColor: <#T##UIColor#>, mainTintColorComplement: <#T##UIColor#>, logoImage: <#T##UIImage?#>, logoBackgroundColor: <#T##UIColor?#>
        )*/

        // Customize the reader (optional)
        //reader.config.articleReader.features.isTextToSpeechEnabled = false

        // Integrate with your article bookmarking system (optional)
        reader.bookmarkProvider = MyBookmarkProvider()

        // Add article sharing if you have a miLibris web kiosk with the sharing option enabled (optional)
        reader.sharingProvider = MySharingProvider(
            kioskBaseURL: URL(string: "https://www.mywebkiosk.com")!,
            issueId: "milibris-issue-id" // the MID of the issue being opened, as returned by the miLibris API
        )

        // Present it
        reader.presentReaderViewController(from: self)
    }

}

extension ViewController: ReaderDelegate {

    func didPresentReaderViewController(_ readerViewController: UIViewController) {
        print("Did open reader")
    }

    func didDismissReaderViewController(_ readerViewController: UIViewController) {
        print("Did close reader")
    }

    func readerViewController(_ readerViewController: UIViewController, willShowProduct product: Product) {
        print("Will show product: \(product)")
    }

    func readerViewController(_ readerViewController: UIViewController, didMoveToPageNumbers pageNumbers: [Int]) {
        print("Did move to page numbers \(pageNumbers)")
    }

    func readerViewControllerDidReachLastPage(_ readerViewController: UIViewController) {
        print("Did move to last page")
    }

    var imageViewForReaderPresentation: UIImageView? {
        return coverImageView
    }

    func readerViewControllerDidPresentSummary(_ readerViewController: UIViewController) {
        print("Did present summary from pages")
    }

    func readerViewControllerDidPresentMiniSummary(_ readerViewController: UIViewController) {
        print("Did present mini summmary")
    }

    func articleReaderViewController(
        _ articleReaderViewController: UIViewController, didOpenArticle article: ArticlePreview
    ) {
        print("Did open article \(article.title)")
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

}
