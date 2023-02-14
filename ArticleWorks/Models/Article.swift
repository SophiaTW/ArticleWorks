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
    let difficulty: String
    let duration: String
    let technology: String
    let contributor: String
    let image: String
    
    init(title: String, domain: String, description: String, createdDate: String, difficulty: String, duration: String, technology: String, contributor: String, image: String) {
        self.title = title
        self.domain = domain
        self.description = description
        self.createdDate = createdDate
        self.difficulty = difficulty
        self.duration = duration
        self.technology = technology
        self.contributor = contributor
        self.image = image
    }
}
