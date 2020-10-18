//
//  Constants.swift
//  RTLNews
//
//  Created by Preema DSouza on 15/10/2020.
//  Copyright © 2020 Preema DSouza. All rights reserved.
//

import Foundation

/// API constants
struct Constants {
    
    private init() { }
    
    static let apiKey = "7e8c1437a08d4bcca3993ec6313dab83"
    static let newsFeedUrl = "http://newsapi.org/v2/everything?q=bitcoin&from=\(Date().serviceFormattedDate())&sortBy=publishedAt&apiKey=\(apiKey)"
    
}
