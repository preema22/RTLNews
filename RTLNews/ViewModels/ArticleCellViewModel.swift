//
//  ArticleViewModel.swift
//  RTLNews
//
//  Created by Preema DSouza on 16/10/2020.
//  Copyright © 2020 Preema DSouza. All rights reserved.
//

import Foundation

/// View Model for ArticleCell
struct ArticleCellViewModel {
    
    let title: String
    let articleImage: URL?
    
    init(article: Article) {
        self.title = article.title
        self.articleImage = article.urlToImage
    }
    
}
