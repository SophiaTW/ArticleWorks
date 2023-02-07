//
//  MyTutorialsViewController.swift
//  ArticleWorks
//
//  Created by Sophia Paulette Muñoz Pailamilla on 06-02-23.
//

import UIKit

class MyTutorialsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    private let articleAPI = ArticleAPI()
    @Published var articleDTO: [ArticleDTO]?
    
    func mostrarEnConsola(){
        print(articleDTO as Any )
    }
}
