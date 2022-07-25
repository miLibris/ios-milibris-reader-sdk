//
//  MyBookmarkProvider.swift
//  MiLibrisReaderSDKSample
//
//  Created by Maxime Le Moine on 15/07/2022.
//

import MiLibrisReaderSDK
import UIKit

/**
 Example implementation of a bookmark provider.
 */
final class MyBookmarkProvider: BookmarkProvider {

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
