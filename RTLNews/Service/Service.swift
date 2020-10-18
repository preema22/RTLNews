//
//  Service.swift
//  RTLNews
//
//  Created by Preema DSouza on 15/10/2020.
//  Copyright © 2020 Preema DSouza. All rights reserved.
//

import Foundation

/// Responsible to fetching news feed from API
class Service {
    
    static let shared = Service()
    
    func fetchNewsFeed(completion: @escaping (Result<[Article]?, Error>) -> Void) {
        guard let url = URL(string: Constants.newsFeedUrl) else {
            completion(.failure(ServiceError.malformedUrl))
            return
        }
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                completion(.failure(error))
            }
            guard let data = data else {
                completion(.failure(ServiceError.invalidResponse))
                return
            }
            do {
                let articleFeed = try JSONDecoder().decode(ArticlesFeed.self, from: data)
                guard articleFeed.status == "ok" else {
                    if let message = articleFeed.message {
                        completion(.failure(ServiceError.requestError(message)))
                    } else {
                        completion(.failure(ServiceError.invalidStatus))
                    }
                    return
                }
                completion(.success(articleFeed.articles))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
}
