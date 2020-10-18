//
//  ArticleViewModelTests.swift
//  RTLNewsTests
//
//  Created by Preema DSouza on 18/10/2020.
//  Copyright © 2020 Preema DSouza. All rights reserved.
//

import XCTest
@testable import RTLNews

/// Tests for ArticleCellViewModel
class ArticleCellViewModelTests: XCTestCase {
    
    func testTitle() throws {
        let article = Article(author: "Author 1", title: "Title 1", description: "Description 1", url: URL(string: "https://www.google.com/")!, urlToImage: URL(string: "https://www.google.com/"), publishedAt: "2020-10-18T09:08:52Z", content: "content 1")
        let viewModel = ArticleCellViewModel(article: article)
        XCTAssertEqual(article.title, viewModel.title)
    }
    
    func testArticleImage() throws {
        let article = Article(author: "Author 1", title: "Title 1", description: "Description 1", url: URL(string: "https://www.google.com/")!, urlToImage: URL(string: "https://www.google.com/"), publishedAt: "2020-10-18T09:08:52Z", content: "content 1")
        let viewModel = ArticleCellViewModel(article: article)
        XCTAssertEqual(article.urlToImage, viewModel.articleImage)
    }
    
}
