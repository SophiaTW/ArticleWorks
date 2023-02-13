//
//  ArticleDetailsViewController.swift
//  ArticleWorks
//
//  Created by Sophia Paulette Muñoz Pailamilla on 13-02-23.
//

import UIKit

class ArticleDetailsViewController: UIViewController {
    
    weak var article : Article?
    
    weak var articleTitle: UILabel!
    weak var articleDomain: UILabel!
    weak var articleDescription: UILabel!
    weak var articleTime: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let articleTitle: UILabel = {
            let text =  UILabel()
            text.frame = .zero
            text.font = .boldSystemFont(ofSize: CGFloat(18.0))
            text.translatesAutoresizingMaskIntoConstraints = false
            text.lineBreakMode = .byWordWrapping
            text.numberOfLines = 2
            return text
        }()
        
        self.view.addSubview(articleTitle)
        NSLayoutConstraint.activate([
            self.view.topAnchor.constraint(equalTo: articleTitle.topAnchor ),
            self.view.leadingAnchor.constraint(equalTo: articleTitle.leadingAnchor, constant: -10),
            self.view.trailingAnchor.constraint(equalTo: articleTitle.trailingAnchor, constant: 80),
       
        ])
        articleTitle.text = "Hello"

        self.articleTitle = articleTitle
        
    }
    
    
    

    
    
    
}


