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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 240/255, green: 244/255, blue: 250/255, alpha: 1)
        self.navigationItem.largeTitleDisplayMode = .never
        
        guard let article = article else {return }
        
        guard let articleImageView = loadImage(article: article) else {return }
        
        
        view.addSubview(articleImageView)
        NSLayoutConstraint.activate([
            articleImageView.widthAnchor.constraint(equalToConstant: view.frame.size.width),
            articleImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -view.frame.size.height*1/3),
            articleImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            articleImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            articleImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        ])
        
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
        
        let articleDescription: UILabel = {
            let text =  UILabel()
            text.frame = .zero
            text.font = .boldSystemFont(ofSize: CGFloat(12.0))
            text.textColor = .lightGray
            text.translatesAutoresizingMaskIntoConstraints = false
            text.numberOfLines = 6
            return text
        }()
        
        view.addSubview(articleTechnology)
        view.addSubview(articleTitle)
        view.addSubview(articleTime)
        view.addSubview(articleDescription)
        
        NSLayoutConstraint.activate([
            articleTitle.topAnchor.constraint(equalTo: articleImageView.bottomAnchor, constant: 10),
            view.leadingAnchor.constraint(equalTo: articleTitle.leadingAnchor, constant: -20),
            view.trailingAnchor.constraint(equalTo: articleTitle.trailingAnchor, constant: 20),
            articleTime.topAnchor.constraint(equalTo: articleTitle.bottomAnchor, constant: 10),
            view.leadingAnchor.constraint(equalTo: articleTime.leadingAnchor, constant: -20),
            view.trailingAnchor.constraint(equalTo: articleTime.trailingAnchor, constant: 20),
            articleDescription.topAnchor.constraint(equalTo: articleTime.bottomAnchor, constant: 20),
            view.leadingAnchor.constraint(equalTo: articleDescription.leadingAnchor, constant: -20),
            view.trailingAnchor.constraint(equalTo: articleDescription.trailingAnchor, constant: 20),
        ])
        articleTitle.text = article.title
        let difficulty = article.difficulty != "" ? "- \(article.difficulty) " : ""
        articleTime.text = "\(article.createdDate) \(difficulty)- Video Course (\(article.duration))"
        articleDescription.text = article.description
        self.articleTitle = articleTitle
        self.articleTime = articleTime
        self.articleDescription = articleDescription
    }
    
    func loadImage(article: Article) -> UIImageView? {
        if let imageUrl = URL(string: article.image) {
            let imageData: NSData = try! NSData(contentsOf: imageUrl)
            let articleImage = UIImage(data: imageData as Data)
            let articleImageView:UIImageView = {
                let img = UIImageView(image: articleImage)
                img.contentMode = .scaleAspectFill
                img.translatesAutoresizingMaskIntoConstraints = false
                img.clipsToBounds = true
                return img
            }()
            return articleImageView
        }
        return nil
    }
    
}


