//
//  ArticleDetailsViewController.swift
//  ArticleWorks
//
//  Created by Sophia Paulette Muñoz Pailamilla on 13-02-23.
//

import UIKit

class ArticleDetailsViewController: UIViewController {
    weak var article : Article?
    weak var articleTechnology: UILabel!
    weak var articleTitle: UILabel!
    weak var articleTime: UILabel!
    weak var articleDescription: UILabel!
    weak var articleContributor: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 240/255, green: 244/255, blue: 250/255, alpha: 1)
        self.navigationItem.largeTitleDisplayMode = .never
        
        guard let article = article else {return }
        
        guard let articleImageView = loadImage(article: article) else {return }
        
        let articleTechnology: UILabel = {
            let text =  UILabel()
            text.frame = .zero
            text.font = .boldSystemFont(ofSize: CGFloat(12.0))
            text.textColor = .lightGray
            text.translatesAutoresizingMaskIntoConstraints = false
            return text
        }()
        
        let articleTitle: UILabel = {
            let text =  UILabel()
            text.frame = .zero
            text.font = .boldSystemFont(ofSize: CGFloat(20.0))
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
        
        let articleDescription: UILabel = {
            let text =  UILabel()
            text.frame = .zero
            text.font = .boldSystemFont(ofSize: CGFloat(12.0))
            text.textColor = .lightGray
            text.translatesAutoresizingMaskIntoConstraints = false
            text.numberOfLines = 6
            return text
        }()
        
        let articleContributor: UILabel = {
            let text =  UILabel()
            text.frame = .zero
            text.font = .boldSystemFont(ofSize: CGFloat(12.0))
            text.textColor = .lightGray
            text.translatesAutoresizingMaskIntoConstraints = false
            text.numberOfLines = 3
            return text
        }()
        
        view.addSubview(articleImageView)
        view.addSubview(articleTechnology)
        view.addSubview(articleTitle)
        view.addSubview(articleTime)
        view.addSubview(articleDescription)
        view.addSubview(articleContributor)
  
        NSLayoutConstraint.activate([
            articleImageView.widthAnchor.constraint(equalToConstant: view.frame.size.width),
            articleImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -view.frame.size.height*1/2),
            articleImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            articleImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            articleImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),

            articleTechnology.topAnchor.constraint(equalTo: articleImageView.bottomAnchor, constant: 20),
            articleTechnology.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            articleTechnology.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            articleTitle.topAnchor.constraint(equalTo: articleTechnology.bottomAnchor, constant: 20),
            articleTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            articleTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            articleTime.topAnchor.constraint(equalTo: articleTitle.bottomAnchor, constant: 20),
            articleTime.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            articleTime.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            articleDescription.topAnchor.constraint(equalTo: articleTime.bottomAnchor, constant: 20),
            articleDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            articleDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            articleContributor.topAnchor.constraint(equalTo: articleDescription.bottomAnchor, constant: 20),
            articleContributor.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            articleContributor.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            //articleContributor.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
        ])
        
        articleTechnology.text = article.technology.uppercased()
        articleTitle.text = article.title
        let difficulty = article.difficulty != "" ? "- \(article.difficulty) " : ""
        articleTime.text = "\(article.createdDate) \(difficulty)- Video Course (\(article.duration))"
        articleDescription.text = article.description
        articleContributor.text = article.contributor
        self.articleTechnology = articleTechnology
        self.articleTitle = articleTitle
        self.articleTime = articleTime
        self.articleDescription = articleDescription
        self.articleContributor = articleContributor
    }
        
    func loadImage(article: Article) -> UIImageView? {
        if let imageUrl = URL(string: article.image) {
            let img = UIImageView()
            img.downloaded(from: imageUrl)
            img.contentMode = .scaleAspectFill
            img.translatesAutoresizingMaskIntoConstraints = false
            img.clipsToBounds = true
            
            return img
        }
        return nil
    }
}


