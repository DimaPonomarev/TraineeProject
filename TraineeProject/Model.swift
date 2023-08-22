//
//  Model.swift
//  TraineeProject
//
//  Created by Дмитрий Пономарев on 14.08.2023.
//

import Foundation

struct NewsFeed: Decodable {
    let status: String
    let articles: [Articles]
    
    struct Articles: Decodable {
        let title: String
        let description: String
        let publishedAt: String
        let urlToImage: String?
        let url: String
    }
}

