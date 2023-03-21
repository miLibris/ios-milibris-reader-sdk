//
//  MySharingProvider.swift
//  MiLibrisReaderSDKSample
//
//  Created by Maxime Le Moine on 15/07/2022.
//

import MiLibrisReaderSDK
import UIKit

class MyWebsiteSharingProvider: SharingProvider {

    func articleSharingContent(article: ArticlePreview) throws -> SharingContent {
        // You could use the miLibris article identifier or the article title to match with articles on your website
        let url = URL(string: "https://www.mywebsite.com/article/\(article.articleId)")!
        return SharingContent(url: url, title: article.title)
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
