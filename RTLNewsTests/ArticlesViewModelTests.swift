//
//  ArticlecViewModelTests.swift
//  RTLNewsTests
//
//  Created by Preema DSouza on 18/10/2020.
//  Copyright © 2020 Preema DSouza. All rights reserved.
//

import XCTest
@testable import RTLNews

/// Tests for ArticlesViewModel
class ArticlesViewModelTests: XCTestCase {
    
    var sut = ArticlesViewModel()
    
    func testArticlesCount() throws {
        let firstArticle = Article(author: "Author 1", title: "Title 1", description: "Description 1", url: URL(string: "https://www.google.com/")!, urlToImage: URL(string: "https://www.google.com/"), publishedAt: "2020-10-18T09:08:52Z", content: "content 1")
        let secondArticle = Article(author: nil, title: "Title 2", description: "Description 2", url: URL(string: "https://www.apple.com")!, urlToImage: URL(string: "https://www.google.com/"), publishedAt: "2020-10-18T09:08:52Z", content: "content 2")
        let thirdArticle = Article(author: "Author 3", title: "Title 3", description: "Description 3", url: URL(string: "https://swift.org/documentation/")!, urlToImage: nil, publishedAt: "2020-10-18T09:08:52Z", content: "content 3")
        
        let articles = [firstArticle, secondArticle, thirdArticle]
        let viewModel = ArticlesViewModel(articles: articles)
        
        XCTAssertEqual(articles.count, viewModel.numberOfArticles())
    }
    
    func testArticleCellViewModel() throws {
        let firstArticle = Article(author: "Author 1", title: "Title 1", description: "Description 1", url: URL(string: "https://www.google.com/")!, urlToImage: URL(string: "https://www.google.com/"), publishedAt: "2020-10-18T09:08:52Z", content: "content 1")
        let secondArticle = Article(author: nil, title: "Title 2", description: "Description 2", url: URL(string: "https://www.apple.com")!, urlToImage: URL(string: "https://www.google.com/"), publishedAt: "2020-10-18T09:08:52Z", content: "content 2")
        let thirdArticle = Article(author: "Author 3", title: "Title 3", description: "Description 3", url: URL(string: "https://swift.org/documentation/")!, urlToImage: nil, publishedAt: "2020-10-18T09:08:52Z", content: "content 3")
        
        let articles = [firstArticle, secondArticle, thirdArticle]
        let viewModel = ArticlesViewModel(articles: articles)
        
        XCTAssertEqual(ArticleCellViewModel(article: secondArticle).title, viewModel.articleCellViewModel(for: 1).title)
        XCTAssertEqual(ArticleCellViewModel(article: secondArticle).articleImage, viewModel.articleCellViewModel(for: 1).articleImage)
    }
    
    func testArticleDetailViewModel() throws {
        let firstArticle = Article(author: "Author 1", title: "Title 1", description: "Description 1", url: URL(string: "https://www.google.com/")!, urlToImage: URL(string: "https://www.google.com/"), publishedAt: "2020-10-18T09:08:52Z", content: "content 1")
        let secondArticle = Article(author: nil, title: "Title 2", description: "Description 2", url: URL(string: "https://www.apple.com")!, urlToImage: URL(string: "https://www.google.com/"), publishedAt: "2020-10-18T09:08:52Z", content: "content 2")
        let thirdArticle = Article(author: "Author 3", title: "Title 3", description: "Description 3", url: URL(string: "https://swift.org/documentation/")!, urlToImage: nil, publishedAt: "2020-10-18T09:08:52Z", content: "content 3")
        
        let articles = [firstArticle, secondArticle, thirdArticle]
        let viewModel = ArticlesViewModel(articles: articles)
        
        XCTAssertEqual(ArticleDetailViewModel(article: thirdArticle).article.author, viewModel.articleDetailViewModel(for: 2).article.author)
        XCTAssertEqual(ArticleDetailViewModel(article: thirdArticle).article.title, viewModel.articleDetailViewModel(for: 2).article.title)
        XCTAssertEqual(ArticleDetailViewModel(article: thirdArticle).article.description, viewModel.articleDetailViewModel(for: 2).article.description)
        XCTAssertEqual(ArticleDetailViewModel(article: thirdArticle).article.url, viewModel.articleDetailViewModel(for: 2).article.url)
        XCTAssertEqual(ArticleDetailViewModel(article: thirdArticle).article.urlToImage, viewModel.articleDetailViewModel(for: 2).article.urlToImage)
        XCTAssertEqual(ArticleDetailViewModel(article: thirdArticle).article.publishedAt, viewModel.articleDetailViewModel(for: 2).article.publishedAt)
        XCTAssertEqual(ArticleDetailViewModel(article: thirdArticle).article.content, viewModel.articleDetailViewModel(for: 2).article.content)
    }
    
}
