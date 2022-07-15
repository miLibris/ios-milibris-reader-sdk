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

        guard let archivePath = Bundle.main.url(forResource: "sample", withExtension: "complete") else {
            fatalError("sample.complete not found in bundle")
        }
        try? FileManager.default.removeItem(at: releasePath)

        // Unpack .complete
        do {
            try MLArchive.extract(archivePath, inDirectory: releasePath)
        } catch {
            print("Error unpacking archive: \(error)")
        }

    }

    @IBOutlet private weak var coverImageView: UIImageView?

    @IBAction private func openReader() {
        print("Open reader")

        let datasource = XmlpdfDatasource(releasePath: releasePath, articlesLanguageCode: .frFR)
        let reader = Reader(datasource: datasource, delegate: self)
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
