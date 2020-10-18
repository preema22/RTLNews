//
//  ArticleDetailViewModel.swift
//  RTLNews
//
//  Created by Preema DSouza on 17/10/2020.
//  Copyright © 2020 Preema DSouza. All rights reserved.
//

import Foundation

/// View Model for ArticleDetailViewController
struct ArticleDetailViewModel {
    
    let article: Article
    
    func formattedDate() -> String? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        if let date = (formatter.date(from: article.publishedAt)) {
            formatter.dateStyle = .long
            formatter.timeStyle = .short
            return formatter.string(from: date)
        }
        return nil
    }
}
