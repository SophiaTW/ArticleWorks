//
//  ArticleDTO.swift
//  ArticleWorks
//
//  Created by Sophia Paulette Muñoz Pailamilla on 06-02-23.
//

import Foundation

final class ArticleDTO: Codable {
    let id: String
    let attributes: AttributesDTO
    let relationships: RelationshipsDTO
}

final class AttributesDTO: Codable {
    let name: String
    let description: String
    let released_at: String
    let duration: Int
    let professional: Bool
    let card_artwork_url: String
}

final class RelationshipsDTO: Codable {
    let domains: RelationshipData
}

final class RelationshipData: Codable {
    let data : [RelationshipDataItem]
}

final class RelationshipDataItem: Codable {
    let id: String
    let type: String
}
