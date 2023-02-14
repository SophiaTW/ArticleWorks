//
//  ViewController.swift
//  ArticleWorks
//
//  Created by Sophia Paulette Muñoz Pailamilla on 02-02-23.
//

import UIKit

class ViewController: UIViewController {
    weak var article : Article?
    weak var articleTitle: UILabel!
    weak var articleTime: UILabel!
    weak var articleDescription: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGray6
        
        guard let article = article else {return }
        
        guard let articleImageView = loadImage(article: article) else {return }
        view.addSubview(articleImageView)
        NSLayoutConstraint.activate([
            articleImageView.widthAnchor.constraint(equalToConstant: view.frame.size.width),
            articleImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -view.frame.size.height*1/3),
            articleImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            articleImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            articleImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
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
        
        let articleDescription: UILabel = {
            let text =  UILabel()
            text.frame = .zero
            text.font = .boldSystemFont(ofSize: CGFloat(12.0))
            text.textColor = .lightGray
            text.translatesAutoresizingMaskIntoConstraints = false
            text.numberOfLines = 6
            return text
        }()
        
        view.addSubview(articleTitle)
        view.addSubview(articleTime)
        view.addSubview(articleDescription)
        
        NSLayoutConstraint.activate([
            articleImageView.bottomAnchor.constraint(equalTo: articleTitle.topAnchor, constant: -10),
            view.leadingAnchor.constraint(equalTo: articleTitle.leadingAnchor, constant: -10),
            view.trailingAnchor.constraint(equalTo: articleTitle.trailingAnchor, constant: 10),
            //containerView.bottomAnchor.constraint(equalTo: articleTitle.bottomAnchor),
            articleTime.topAnchor.constraint(equalTo: articleTitle.bottomAnchor, constant: 10),
            view.leadingAnchor.constraint(equalTo: articleTime.leadingAnchor, constant: -10),
            view.trailingAnchor.constraint(equalTo: articleTime.trailingAnchor, constant: 10),
            articleDescription.topAnchor.constraint(equalTo: articleTime.bottomAnchor, constant: 20),
            view.leadingAnchor.constraint(equalTo: articleDescription.leadingAnchor, constant: -10),
            view.trailingAnchor.constraint(equalTo: articleDescription.trailingAnchor, constant: 10),
            //view.bottomAnchor.constraint(equalTo: articleTime.bottomAnchor),
        ])
        articleTitle.text = article.title
        articleTime.text = "\(article.createdDate) - Video Course (\(article.duration))"
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
                img.contentMode = .scaleAspectFit
                img.translatesAutoresizingMaskIntoConstraints = false
                img.clipsToBounds = true
                return img
            }()
            return articleImageView
        }
        return nil
    }
    
}

