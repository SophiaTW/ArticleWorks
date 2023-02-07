//
//  MyTutorialsView.swift
//  ArticleWorks
//
//  Created by Paula Daniela Nieto Ponce on 07-02-23.
//

import Foundation
import UIKit

class MyTutorialsView: UIViewController {
    private let articleAPI = ArticleAPI()
    @Published var articles: [Article]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        articleAPI.getAllArticles(query: "") {[weak self] response in
            print(response)
            guard let self = self else {return }
            self.articles = response
        }
    }
}
