//
//  ArticlesDTO.swift
//  ArticleWorks
//
//  Created by Paula Daniela Nieto Ponce on 03-02-23.
//

import Foundation

final class ArticlesDTO: Codable {
    let name: String
    let description: String
    let released_at: Date
    let duration: Int
    let card_artwork_url: String
}
