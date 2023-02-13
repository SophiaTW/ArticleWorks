//
//  CellViewController.swift
//  ArticleWorks
//
//  Created by Paula Daniela Nieto Ponce on 13-02-23.
//

import Foundation
import UIKit

class Cell: UICollectionViewCell {
    static var identifier: String = "Cell"
    weak var title: UILabel!
    weak var domain: UILabel!
    weak var desc: UILabel!
    weak var time: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)

        let title: UILabel = {
            let text =  UILabel()
            text.frame = .zero
            text.font = .boldSystemFont(ofSize: CGFloat(18.0))
            text.translatesAutoresizingMaskIntoConstraints = false
            text.lineBreakMode = .byWordWrapping
            text.numberOfLines = 2
            return text
        }()
        
        let domain: UILabel = {
            let text =  UILabel()
            text.frame = .zero
            text.font = .boldSystemFont(ofSize: CGFloat(12.0))
            text.textColor = .lightGray
            text.translatesAutoresizingMaskIntoConstraints = false
            return text
        }()
        
        let desc: UILabel = {
            let text =  UILabel()
            text.frame = .zero
            text.font = .boldSystemFont(ofSize: CGFloat(12.0))
            text.textColor = .lightGray
            text.translatesAutoresizingMaskIntoConstraints = false
            //text.lineBreakMode = .byWordWrapping
            text.numberOfLines = 2
            return text
        }()
        
        let time: UILabel = {
            let text =  UILabel()
            text.frame = .zero
            text.font = .boldSystemFont(ofSize: CGFloat(12.0))
            text.textColor = .lightGray
            text.translatesAutoresizingMaskIntoConstraints = false
            return text
        }()
        
        self.contentView.addSubview(title)
        self.contentView.addSubview(domain)
        self.contentView.addSubview(desc)
        self.contentView.addSubview(time)
        NSLayoutConstraint.activate([
            self.contentView.leadingAnchor.constraint(equalTo: title.leadingAnchor, constant: -10),
            self.contentView.trailingAnchor.constraint(equalTo: title.trailingAnchor, constant: 80),
            self.contentView.topAnchor.constraint(equalTo: title.topAnchor, constant: -10),
            title.bottomAnchor.constraint(equalTo: domain.topAnchor, constant: -5),
            self.contentView.leadingAnchor.constraint(equalTo: domain.leadingAnchor, constant: -10),
            self.contentView.trailingAnchor.constraint(equalTo: domain.trailingAnchor, constant: 80),
            domain.bottomAnchor.constraint(equalTo: desc.topAnchor, constant: -25),
            self.contentView.leadingAnchor.constraint(equalTo: desc.leadingAnchor, constant: -10),
            self.contentView.trailingAnchor.constraint(equalTo: desc.trailingAnchor, constant: 10),
            desc.bottomAnchor.constraint(equalTo: time.topAnchor, constant: -20),
            self.contentView.leadingAnchor.constraint(equalTo: time.leadingAnchor, constant: -10),
        ])
        self.title = title
        self.domain = domain
        self.desc = desc
        self.time = time
        self.reset()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        self.reset()
    }

    func reset() {
        self.title.textAlignment = .left
    }
}
