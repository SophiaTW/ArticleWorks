//
//  ArticleDTO.swift
//  ArticleWorks
//
//  Created by Sophia Paulette Muñoz Pailamilla on 06-02-23.
//

import Foundation

/**

 {
         "id" : "10628623",
         "type" : "contents",
         "attributes" : {
             "name" : "Mac Catalyst with Andy Pereira – Podcast S10 E7",
             "description" : "Dru flips the switch on his 50th show with Andy Pereira telling us how easy Catalyst can be. After Dru talks about transitioning from developer to architect. \n",
             "released_at" : "2020-05-20T18:01:43.000Z",
             "duration" : 60,
             "professional" : false,
             "card_artwork_url" : "https://koenig-media.raywenderlich.com/uploads/2016/02/Logo.png"
         },
         "relationships" : {
             "domains" : {
                 "data" : [
                     {
                         "id" : "1",
                         "type" : "domains"
                     },
                     {
                         "id" : "7",
                         "type" : "domains"
                     }
                 ]
             },
         },
     },
 
 */

final class ArticleDTO: Codable {
    let id: String
    let attributes: AttributesDTO
    let relationships: relationshipsDTO
}

final class AttributesDTO: Codable {
    let name: String
    let description: String
    let released_at: Date
    let duration: Int
    let professional: Bool
    let card_artwork_url: URL

}

final class relationshipsDTO: Codable {
    let progression: String
}
