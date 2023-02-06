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
    
    /*
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleDTO?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return articleDTO
    }*/
    
    
    
    
}
