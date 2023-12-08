//
//  NewsResponse.swift
//  NewsApp
//
//  Created by Michelle Gunawan on 12/8/23.
//

import Foundation

struct NewsAppp: Codable{
    let articles: [Article]
}

struct Article: Codable{
    let author: String?
    let url: String
    let source, title, articleDescription: String
    let image: String
    let date: Date
    
    // description is key word in swift so we have to assign it to another tag
    enum CodingKeys: String, CodingKey{
        case author, url, source, title
        case articleDescription = "description"
        case image, date
    }
}
