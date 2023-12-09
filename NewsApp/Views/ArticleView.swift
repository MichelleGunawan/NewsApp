//
//  ArticleView.swift
//  NewsApp
//
//  Created by Michelle Gunawan on 12/8/23.
//

import SwiftUI
import URLImage

struct ArticleView: View {
    let article: Article

    var body: some View {
        HStack {
            if let imgUrl = article.image,
               let url = URL(string: imgUrl)
            {
                URLImage(
                    url,
                    identifier: article.id.uuidString,
                    failure: { _, _ in
                        PlaceholderImageView()
                    },
                    content: { image in image.resizable().aspectRatio(contentMode: .fill) }
                )
                .frame(width: 100, height: 100)
                .cornerRadius(10)

            } else { PlaceholderImageView() }

            VStack(alignment: .leading, spacing: 4) {
                // Display article title
                if let title = article.title {
                    Text(title)
                        .foregroundColor(.black)
                        .font(.system(size: 18, weight: .semibold))
                } else {
                    Text("No Title Available")
                        .foregroundColor(.black)
                        .font(.system(size: 18, weight: .semibold))
                    // or any default text in case title is nil
                }

                HStack {
                    // Display article source
                    if let source = article.source {
                        Text(source)
                            .foregroundColor(.gray)
                            .font(.footnote)
                    } else {
                        Text("N/A")
                            .foregroundColor(.gray)
                            .font(.footnote)
                    }

                    Spacer()

                    // Display article date
                    if let articleDate = article.date,
                       let date = formattedDate(articleDate)
                    {
                        Text(date)
                            .foregroundColor(.gray)
                            .font(.footnote)
                    } else {
                        Text("")
                            .foregroundColor(.gray)
                            .font(.footnote)
                    }
                }
            }
        }
    }
}

// Function to format Date to String
func formattedDate(_ date: Date) -> String? {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    formatter.timeStyle = .short
    return formatter.string(from: date)
}

// Placeholder image if no image found
struct PlaceholderImageView: View {
    var body: some View {
        Image(systemName: "photo.fill")
            .foregroundColor(.white)
            .background(.gray)
            .frame(width: 100, height: 100)
    }
}

#Preview {
    ArticleView(article: Article.dummyData)
}
