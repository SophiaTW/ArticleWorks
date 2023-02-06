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
             "uri" : "rw://koenig/post/255285",
             "name" : "Mac Catalyst with Andy Pereira – Podcast S10 E7",
             "description" : "Dru flips the switch on his 50th show with Andy Pereira telling us how easy Catalyst can be. After Dru talks about transitioning from developer to architect. \n",
             "released_at" : "2020-05-20T18:01:43.000Z",
             "free" : true,
             "difficulty" : "intermediate",
             "content_type" : "article",
             "duration" : 60,
             "popularity" : 1366,
             "technology_triple_string" : "Swift 5, iOS 13, Xcode 11",
             "contributor_string" : "Dru Freeman",
             "ordinal" : null,
             "professional" : false,
             "description_plain_text" : "Dru flips the switch on his 50th show with Andy Pereira telling us how easy Catalyst can be. After Dru talks about transitioning from developer to architect. \n",
             "video_identifier" : null,
             "parent_name" : null,
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
             "child_contents" : {
                 "meta" : {
                     "count" : 0
                 }
             },
             "progression" : {
                 "data" : null
             },
             "bookmark" : {
                 "data" : null
             }
         },
         "links" : {
             "self" : "http://api.raywenderlich.com/api/contents/10628623-mac-catalyst-with-andy-pereira-podcast-s10-e7"
         }
     },
 
 */

final class ArticleDTO: Codable {
    let id: String
    let attributes: AttributesDTO
    let relationships: relationshipsDTO
}

class AttributesDTO: Codable {
    let name: String
    let description: String
    let released_at: Date
    let difficulty: String
    let duration: Int
    let technology_triple_string: String
    let card_artwork_url: URL

}

class relationshipsDTO:Codable {
    let progression: String
}
