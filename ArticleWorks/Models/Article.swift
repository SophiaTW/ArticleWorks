//
//  Article.swift
//  ArticleWorks
//
//  Created by Sophia Paulette Muñoz Pailamilla on 03-02-23.
//

import Foundation

final class Article {
    let title: String
    let domain: String
    let description: String
    let createdDate: String
    let duration: String
    let image: String
    
    init(title: String, domain: String, description: String, createdDate: String, duration: String, image: String) {
        self.title = title
        self.domain = domain
        self.description = description
        self.createdDate = createdDate
        self.duration = duration
        self.image = image
    }
}
