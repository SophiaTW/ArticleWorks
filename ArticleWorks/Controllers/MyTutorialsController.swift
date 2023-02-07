//
//  MyTutorialsViewController.swift
//  ArticleWorks
//
//  Created by Sophia Paulette Muñoz Pailamilla on 06-02-23.
//

import UIKit
import Foundation

class MyTutorialsController {
    private let articleAPI = ArticleAPI()
    @Published var ArticleDTO: [ArticleDTO]?
    
    init(){
        articleAPI.getAllArticles(query: "") {[weak self] response in
            print(response)
            guard let self = self else {return }
            self.ArticleDTO = response.data
        }
    }
}
