//
//  MyTutorialsView.swift
//  ArticleWorks
//
//  Created by Paula Daniela Nieto Ponce on 07-02-23.
//

import Foundation
import UIKit
import Combine

class MyTutorialsView: UIViewController, UITableViewDataSource, UITableViewDelegate {
    lazy var tableView = UITableView()
    private var cancellable: AnyCancellable?
    private let articleAPI = ArticleAPI()
    @Published var articles: [Article]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        articleAPI.getAllArticles(query: "") {[weak self] response in
            print(response)
            guard let self = self else {return }
            self.articles = response
        }
        tableView.dataSource = self
        tableView.delegate = self
        setUpView()
        setUpConstraints()
        bindData()
    }
    func setUpView() {
        view.addSubview(tableView)
    }
    func setUpConstraints() {
        tableView.frame = view.bounds
    }
    // TODO: Que hace BindData? (pregunta para juan)
    func bindData() {
        cancellable = $articles
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: {[weak self] _ in
                self?.tableView.reloadData()
            })
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "Cell")
        var content = cell.defaultContentConfiguration()
        if let articleResult = articles?[indexPath.row] {
            content.text = articleResult.title
            content.secondaryText = "\(articleResult.domain)\n\n\(articleResult.description) \n\(articleResult.createdDate) - Video Course (\(articleResult.duration))"
            if let imageUrl = URL(string: articleResult.image) {
                var imageData: NSData = try! NSData(contentsOf: imageUrl)
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
        cell.contentConfiguration = content
        return cell
    }
}
