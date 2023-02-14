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
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -80),
            title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            
            domain.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 5),
            domain.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            domain.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -80),
            
            desc.topAnchor.constraint(equalTo: domain.bottomAnchor, constant: 25),
            desc.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            desc.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            time.topAnchor.constraint(equalTo: desc.bottomAnchor, constant: 20),
            time.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
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
