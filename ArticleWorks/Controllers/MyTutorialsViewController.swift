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
    private let articleAPI = ArticleAPI()
    @Published var articles: [Article]?

    override func loadView() {
        super.loadView()
        articleAPI.getAllArticles(query: "") {[weak self] response in
            print(response)
            guard let self = self else {return }
            self.articles = response
        }
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .init(width: view.frame.size.width - 30, height: 180)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(collectionView)
        self.collectionView = collectionView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.backgroundColor = .systemGray6
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(Cell.self, forCellWithReuseIdentifier: Cell.identifier)
        //self.collectionView.alwaysBounceVertical = true
        NSLayoutConstraint.activate([
            self.view.topAnchor.constraint(equalTo: collectionView.topAnchor),
            self.view.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor),
            self.view.leadingAnchor.constraint(equalTo: collectionView.leadingAnchor),
            self.view.trailingAnchor.constraint(equalTo: collectionView.trailingAnchor),
        ])
        bindData()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Write your navigation controller name instead of **ViewController**
        //let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ViewController") as? ViewController
        //self.navigationController?.pushViewController(vc!, animated: true)
        
        navigationController?.pushViewController(ViewController(), animated: true)

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

        if let articleResult = articles?[indexPath.row] {
            cell.title.text = articleResult.title
            cell.domain.text = articleResult.domain
            cell.desc.text = articleResult.description
            cell.time.text = "\(articleResult.createdDate) - Video Course (\(articleResult.duration))"
            if let imageUrl = URL(string: articleResult.image) {
                let imageData: NSData = try! NSData(contentsOf: imageUrl)
                let articleImage = UIImage(data: imageData as Data)
                let articleImageView:UIImageView = {
                    let img = UIImageView(image: articleImage)
                    img.contentMode = .scaleAspectFill
                    img.translatesAutoresizingMaskIntoConstraints = false
                    img.layer.cornerRadius = 10
                    img.clipsToBounds = true
                    return img
                }()
                cell.addSubview(articleImageView)
                articleImageView.widthAnchor.constraint(equalToConstant:60).isActive = true
                articleImageView.heightAnchor.constraint(equalToConstant:60).isActive = true
                articleImageView.trailingAnchor.constraint(equalTo: cell.trailingAnchor, constant: -10).isActive = true
                articleImageView.topAnchor.constraint(equalTo: cell.topAnchor, constant: 10).isActive = true
            }
            
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
}

