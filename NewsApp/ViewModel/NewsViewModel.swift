//
//  NewsViewModel.swift
//  NewsApp
//
//  Created by Michelle Gunawan on 12/8/23.
//

import Combine
import Foundation

protocol NewsViewModel {
    func getArticles()
}

class NewsViewModelImpl: ObservableObject, NewsViewModel {
    private let service: NewsService
    private(set) var articles = [Article]()
    private var cancellables = Set<AnyCancellable>()

    @Published private(set) var state: ResultState = .loading // frontend state

    init(service: NewsService) {
        self.service = service
    }

    func getArticles() {
        state = .loading

        let cancellable = service
            .request(from: .getNews)
            .sink(receiveCompletion: { res in
                switch res {
                case .finished:
                    self.state = .success(content: self.articles)
                case .failure(let error):
                    self.state = .failed(error: error)
                }
            }, receiveValue: { response in
                self.articles = response.articles
            })
        
        cancellables.insert(cancellable)
    }
}
