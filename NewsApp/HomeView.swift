//
//  HomeView.swift
//  NewsApp
//
//  Created by Michelle Gunawan on 12/8/23.
//

import SwiftUI

struct HomeView: View {
    @Environment(\.openURL) var openUrl

    @StateObject var viewModel = NewsViewModelImpl(service: NewsServiceImpl())

    var body: some View {
        NavigationView {
            Group {
                switch viewModel.state {
                case .loading:
                    ProgressView()
                case .failed(let error):
                    ErrorView(error: error, handler: viewModel.getArticles)
                case .success(let articles):
                    let filteredArticles = articles.filter { article in
                        if let title = article.title, !title.contains("removed"),
                           let url = article.url,!url.contains("removed")
                        {
                            return !title.isEmpty && !url.isEmpty
                        }
                        return false
                    }

                    List(filteredArticles) { item in
                        ArticleView(article: item)
                            .onTapGesture { load(url: item.url) }

                            .navigationTitle(Text("News"))
                    }
                }
            }.onAppear(perform: viewModel.getArticles)
        }
    }

    func load(url: String?) {
        guard let link = url,
              let url = URL(string: link)
        else { return }

        openUrl(url)
    }
}

#Preview {
    HomeView()
}
