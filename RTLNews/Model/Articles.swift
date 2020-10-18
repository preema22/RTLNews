//
//  Articles.swift
//  RTLNews
//
//  Created by Preema DSouza on 15/10/2020.
//  Copyright © 2020 Preema DSouza. All rights reserved.
//

import Foundation

/// Struct for Articles 
struct ArticlesFeed: Decodable {
    let status: String
    let articles: [Article]?
    let message: String?
}

struct Article: Decodable {
    let author: String?
    let title: String
    let description: String
    let url: URL
    let urlToImage: URL?
    let publishedAt: String
    let content: String?
}
