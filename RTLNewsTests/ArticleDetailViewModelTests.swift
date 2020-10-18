//
//  ArticleDetailViewModelTests.swift
//  RTLNewsTests
//
//  Created by Preema DSouza on 18/10/2020.
//  Copyright © 2020 Preema DSouza. All rights reserved.
//

import XCTest
@testable import RTLNews

/// Tests for ArticleDetailViewModel
class ArticleDetailViewModelTests: XCTestCase {
    
    func testArticleDetailViewModel() throws {
        let article = Article(author: "Author 1", title: "Title 1", description: "Description 1", url: URL(string: "https://www.google.com/")!, urlToImage: URL(string: "https://www.google.com/"), publishedAt: "2020-10-18T09:08:52Z", content: "content 1")
        let viewModel = ArticleDetailViewModel(article: article)
        XCTAssertEqual(article.author, viewModel.article.author)
        XCTAssertEqual(article.title, viewModel.article.title)
        XCTAssertEqual(article.description, viewModel.article.description)
        XCTAssertEqual(article.url, viewModel.article.url)
        XCTAssertEqual(article.urlToImage, viewModel.article.urlToImage)
        XCTAssertEqual(article.publishedAt, viewModel.article.publishedAt)
        XCTAssertEqual(article.content, viewModel.article.content)
    }
    
    func testFormattedDate() throws {
        let article = Article(author: "Author 1", title: "Title 1", description: "Description 1", url: URL(string: "https://www.google.com/")!, urlToImage: URL(string: "https://www.google.com/"), publishedAt: "2020-10-18T09:08:52Z", content: "content 1")
        let viewModel = ArticleDetailViewModel(article: article)
        XCTAssertNotNil(viewModel.formattedDate)
    }
    
}
