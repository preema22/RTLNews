//
//  ArticlesViewModel.swift
//  RTLNews
//
//  Created by Preema DSouza on 15/10/2020.
//  Copyright © 2020 Preema DSouza. All rights reserved.
//

import Foundation

/// View Model for ArticlesViewController
class ArticlesViewModel {
    
    let articles: Dynamic<[Article]>
    let errorMessage: Dynamic<String?>
    
    init(articles: [Article] = []) {
        self.articles = Dynamic(articles)
        self.errorMessage = Dynamic(nil)
    }
    
    /// Helper for number of rows
    func numberOfArticles() -> Int {
        return articles.value.count
    }
    
    /// Helper for cell
    func articleCellViewModel(for index: Int) -> ArticleCellViewModel {
        return ArticleCellViewModel(article: articles.value[index])
    }
    
    /// Helper for didSelectItem
    func articleDetailViewModel(for index: Int) -> ArticleDetailViewModel {
        return ArticleDetailViewModel(article: articles.value[index])
    }
    
}

// MARK: - API call to fetch news feed

extension ArticlesViewModel {
    /// Fetches news feed from API with the help of Service singleton
    func fetchNewsFeed() {
        Service.shared.fetchNewsFeed { [weak self] result in
            switch result {
            case .success(let articles):
                if let articles = articles {
                    self?.articles.value = articles
                }
            case .failure(let error):
                self?.errorMessage.value = error.localizedDescription
            }
        }
    }
}
