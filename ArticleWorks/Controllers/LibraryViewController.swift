//
//  LibraryViewController.swift
//  ArticleWorks
//
//  Created by Sophia Paulette Muñoz Pailamilla on 06-02-23.
//

import UIKit

class LibraryViewController: UIViewController {
    private let articleAPI = ArticleAPI()
    @Published var ArticleDTO: [ArticleDTO]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("hola")

        // Do any additional setup after loading the view.
        articleAPI.getAllArticles(query: "") {[weak self] response in
            print(response)
            guard let self = self else {return }
            self.ArticleDTO = response.data
            print(response.data)
        }
        
    }
}








