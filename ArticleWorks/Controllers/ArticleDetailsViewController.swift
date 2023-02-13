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
    weak var articleTime: UILabel!
    weak var articleDescription: UILabel!
    weak var articleTechnology: UILabel!
    weak var articleContributor: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let containerView = UIView()
            containerView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(containerView)
            NSLayoutConstraint.activate([
                self.view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
                self.view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
                self.view.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
                self.view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10),
            ])
        
        let articleTitle: UILabel = {
            let text =  UILabel()
            text.frame = .zero
            text.font = .boldSystemFont(ofSize: CGFloat(18.0))
            text.translatesAutoresizingMaskIntoConstraints = false
            text.lineBreakMode = .byWordWrapping
            text.numberOfLines = 2
            return text
        }()
        
        let articleTime: UILabel = {
            let text =  UILabel()
            text.frame = .zero
            text.font = .boldSystemFont(ofSize: CGFloat(12.0))
            text.textColor = .lightGray
            text.translatesAutoresizingMaskIntoConstraints = false
            return text
        }()
        
        containerView.addSubview(articleTitle)
        containerView.addSubview(articleTime)
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: articleTitle.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: articleTitle.leadingAnchor, constant: -10),
            containerView.trailingAnchor.constraint(equalTo: articleTitle.trailingAnchor, constant: 40),
            //containerView.bottomAnchor.constraint(equalTo: articleTitle.bottomAnchor),
            articleTime.topAnchor.constraint(equalTo: articleTitle.bottomAnchor),
            containerView.bottomAnchor.constraint(equalTo: articleTime.bottomAnchor),
        ])
        articleTitle.text = "Hello"
        articleTime.text = "Tiempo"
        self.articleTitle = articleTitle
        self.articleTime = articleTime
        
    }
    
    
   
}


