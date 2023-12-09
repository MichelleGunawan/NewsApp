//
//  NewsResponse.swift
//  NewsApp
//
//  Created by Michelle Gunawan on 12/8/23.
//

import Foundation

struct NewsResponse: Codable {
    let articles: [Article]
}

struct Article: Codable, Identifiable {
    let id = UUID()
    let author: String?
    let url: String?
    let source, title, articleDescription: String?
    let image: String?
    let date: Date?

    // description is key word in swift so we have to assign it to another tag
    enum CodingKeys: String, CodingKey {
        case author, url, source, title
        case articleDescription = "description"
        case image, date
    }
}

// example data
extension Article {
    static var dummyData: Article {
        .init(
            author: "Brad Pitt",
            url: "https://www.cbssports.com/nfl/news/steelers-vs-patriots-odds-line-spread-thursday-night-football-picks-predictions-by-model-on-176-128-roll/",
            source: "CBS Sports",
            title: "Steelers vs. Patriots odds, line, spread: Thursday Night Football picks, predictions by model on 176-128 roll - CBS Sports",
            articleDescription: "SportsLine's model has simulated New England Patriots vs. Pittsburgh Steelers on Thursday Night Football 10,000 times",
            image: "https://sportshub.cbsistatic.com/i/r/2022/11/10/d3cbbe25-dce7-4bed-958d-36486c2d594e/thumbnail/1200x675/93d16b71adcc4d734395900a9943cfa1/jaylen-warren-1400-us.jpg",
            date: Date()
        )
    }
}
