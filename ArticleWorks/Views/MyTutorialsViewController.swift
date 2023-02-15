//
//  CollectionViewController.swift
//  ArticleWorks
//
//  Created by Paula Daniela Nieto Ponce on 13-02-23.
//

import Foundation
import UIKit
import Combine

class MyTutorialsController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    private var cancellable: AnyCancellable?
    
    weak var collectionView: UICollectionView!
    weak var articleImageView: UIImageView?
    private let articleAPI = ArticleAPI()
    @Published var articles: [Article]?
    
    override func loadView() {
        super.loadView()
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .init(width: view.frame.size.width - 30, height: 180)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(collectionView)
        self.collectionView = collectionView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        articleAPI.getAllArticles(query: "") {[weak self] response in
            print(response)
            guard let self = self else {return }
            self.articles = response
        }
        
        self.collectionView.backgroundColor = UIColor(red: 240/255, green: 244/255, blue: 250/255, alpha: 1)
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(Cell.self, forCellWithReuseIdentifier: Cell.identifier)
        
        NSLayoutConstraint.activate([
            self.view.topAnchor.constraint(equalTo: collectionView.topAnchor),
            self.view.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor),
            self.view.leadingAnchor.constraint(equalTo: collectionView.leadingAnchor),
            self.view.trailingAnchor.constraint(equalTo: collectionView.trailingAnchor),
        ])
        bindData()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = ArticleDetailsViewController()
        vc.article = articles?[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return articles?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.identifier, for: indexPath) as! Cell
        cell.backgroundColor = .white
        cell.layer.cornerRadius = 10
        
        guard let articleResult = articles?[indexPath.row] else {return cell}
        cell.title.text = articleResult.title
        cell.domain.text = articleResult.domain
        cell.desc.text = articleResult.description
        cell.time.text = "\(articleResult.createdDate) - Video Course (\(articleResult.duration))"
        
        if let articleImageView = loadImage(article: articleResult) {
            cell.addSubview(articleImageView)
            articleImageView.widthAnchor.constraint(equalToConstant:60).isActive = true
            articleImageView.heightAnchor.constraint(equalToConstant:60).isActive = true
            articleImageView.trailingAnchor.constraint(equalTo: cell.trailingAnchor, constant: -10).isActive = true
            articleImageView.topAnchor.constraint(equalTo: cell.topAnchor, constant: 10).isActive = true
        }
        return cell
    }
    
    func bindData() {
        cancellable = $articles
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: {[weak self] _ in
                self?.collectionView.reloadData()
            })
    }
    
    func loadImage(article: Article) -> UIImageView? {
        
        if let imageUrl = URL(string: article.image) {
            
            let img = UIImageView()
            img.downloaded(from: imageUrl)
            img.contentMode = .scaleAspectFill
            img.translatesAutoresizingMaskIntoConstraints = false
            img.layer.cornerRadius = 10
            img.clipsToBounds = true
            
            return img
        }
        return nil
    }
}

