//
//  IncludedDTO.swift
//  ArticleWorks
//
//  Created by Sophia Paulette Muñoz Pailamilla on 06-02-23.
//

import Foundation

/*
 "id" : "1",
                 "type" : "domains",
                 "attributes" : {
                     "name" : "iOS & Swift",
                     "slug" : "ios",
                     "description" : "Learn iOS development in Swift",
                     "level" : "production",
                     "ordinal" : 1
 */

final class IncludedDTO: Codable{
    
    let id: String
    let type: String
    let attributes: IncludedAttributesDTO
    
}

class IncludedAttributesDTO: Codable{
    
    let name: String
    let slug: String
    let description: String
    let level: String
    let ordinal: Int
}
