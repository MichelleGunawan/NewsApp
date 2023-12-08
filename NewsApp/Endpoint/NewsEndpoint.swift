//
//  NewsEndpoint.swift
//  NewsApp
//
//  Created by Michelle Gunawan on 12/8/23.
//

import Foundation

protocol APIBuilder{
    var urlRequest: URLRequest{get}
    var base: URL {get}
    var path: String{get}
}

enum NewsAPI{
    case getNews
}

extension NewsAPI: APIBuilder {
    var urlRequest: URLRequest {
        return URLRequest(url: self.base.appendingPathComponent(self.path))
    }
    
    var base: URL {
        switch self{
        case .getNews:
            return URL(string:"https://api.lil.software")!
        }
    }
    
    var path: String {
        return "/news"
    }
    
    
}
