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
        if let articlesResult = articles?[indexPath.row] {
            cell.textLabel?.text = articlesResult.title
            if let imageUrl = URL(string: articlesResult.image) {
                var imageData: NSData = try! NSData(contentsOf: imageUrl)
                var articleImage = UIImage(data: imageData as Data)
                cell.imageView?.image = articleImage
            }
        }
        return cell
    }
}
