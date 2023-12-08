//
//  APIError.swift
//  NewsApp
//
//  Created by Michelle Gunawan on 12/8/23.
//

import Foundation

enum APIError: Error{
    case decodingError
    case errorCode(Int)
    case unknown
}

extension: LocalizedError{
    var errorDescription: String? {
        switch self{
        case .decodingError:
            return "Failed to decode the object from the service"
        case .errorCode(let code):
            return "\(code) - Something went wrong"
        case .unknown:
            return "The error is unknown"
        }
    }
}
