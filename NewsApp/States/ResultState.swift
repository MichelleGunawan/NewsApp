//
//  ResultState.swift
//  NewsApp
//
//  Created by Michelle Gunawan on 12/8/23.
//

import Foundation
enum ResultState {
    case loading
    case success(content: [Article])
    case failed(error: Error)
}
