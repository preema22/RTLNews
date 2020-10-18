//
//  ApiErrors.swift
//  RTLNews
//
//  Created by Preema DSouza on 15/10/2020.
//  Copyright © 2020 Preema DSouza. All rights reserved.
//

import Foundation

/// Custom errors for API response
enum ServiceError: Error {
    case malformedUrl
    case invalidResponse
    case invalidStatus
    case requestError(String)
}

extension ServiceError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .malformedUrl:
            return "Invalid url"
        case .invalidResponse:
            return "Invalid response"
        case .invalidStatus:
            return "Api returned an error"
        case .requestError(let detail):
            return detail
        }
    }
}
